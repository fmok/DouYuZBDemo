//
//  FMPageTitleView.swift
//  DYZB
//
//  Created by fm on 2017/7/13.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

protocol FMPageTitleViewDelegate: class {  // class 表示协议只能被 类 遵守
    func pageTitleView(titleView: FMPageTitleView, selectedIndex index: Int)
}

private let kScrollLineH: CGFloat = 2

class FMPageTitleView: UIView {
    
    // MARK - 定义属性
    fileprivate var titles: [String]
    fileprivate var currentIndex: Int = 0
    weak var delegate: FMPageTitleViewDelegate?
    
    // MARK - 懒加载属性
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        // 注意：如果需要点击状态栏回到顶部的话，需要将其他所有scrollView的scrollsToTop属性设置成false
        scrollView.isPagingEnabled = false
        scrollView.bounces = false // 范围不能超过内容的范围
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    fileprivate lazy var titleLabels: [UILabel] = [UILabel]()

    // MARK - 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        // 设置UI
        setUpUI()
    }
    
    // MARK - 自定义构造函数，必须重写下面这个方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK - 设置UI界面
extension FMPageTitleView {
    fileprivate func setUpUI() {
        // 1、添加ScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2、添加title对应的label
        setUpTitleLabel()
        
        // 3、设置底线 滚动滑块
        setUpBottomMenuAndScrollLine()
    }
    
    private func setUpTitleLabel() {
        
        // 0、确定label的frame值
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kScrollLineH
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            // 1、创建UILabel
            let label = UILabel()
            
            // 2、设置label属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            // 3、设置label的frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 4、将label添加到scrollView中
            scrollView.addSubview(label)
            
            // 5、将label添加到 titleLabels中
            titleLabels.append(label)
            
            // 6、给label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    private func setUpBottomMenuAndScrollLine() {
        // 1、添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 2、添加滚动的线
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor.orange
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height-kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

// MARK - 监听label的点击
extension FMPageTitleView {
    @objc fileprivate func titleLabelClick(tapGes: UITapGestureRecognizer) {
        // 1、获取当前label的下标
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        // 2、获取之前的label
        let oldLabel = titleLabels[currentIndex]
        
        // 3、保存最新label的下标
        currentIndex = currentLabel.tag
        
        // 4、切换文字颜色
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.darkGray
        
        // 5、滚动条位置更新
        let scrollLinePositionX = CGFloat(currentLabel.tag) * scrollLine.frame.size.width
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLinePositionX
        }
        
        // 6、通知代理做出详情操作
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}





