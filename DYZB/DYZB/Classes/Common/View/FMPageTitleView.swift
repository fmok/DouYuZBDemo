//
//  FMPageTitleView.swift
//  DYZB
//
//  Created by fm on 2017/7/13.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

private let kScrollLineH: CGFloat = 2

class FMPageTitleView: UIView {
    
    // MARK - 定义属性
    fileprivate var titles: [String]
    
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

extension FMPageTitleView {
    fileprivate func setUpUI() {
        // 1、添加ScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2、添加title对应的label
        setUpTitleLabel()
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
            label.textColor = UIColor.green
            label.textAlignment = .center
            
            // 3、设置label的frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 4、将label添加到scrollView中
            scrollView.addSubview(label)
        }
    }
}






