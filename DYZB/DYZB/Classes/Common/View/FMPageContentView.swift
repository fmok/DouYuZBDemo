//
//  FMPageContentView.swift
//  DYZB
//
//  Created by fm on 2017/7/13.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

private let contentCellIdentifier = "contentCellIdentifier"

class FMPageContentView: UIView {

    // MARK - 定义属性
    fileprivate var childVCs: [UIViewController]
    fileprivate weak var parentVC: UIViewController?
    
    // MARK - 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellIdentifier)
        return collectionView
    }()
    
    // MARK - 自定义构造函数
    init(frame: CGRect, childVCs: [UIViewController], parentViewController: UIViewController?) {
        self.childVCs = childVCs
        self.parentVC = parentViewController
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK - 设置UI界面
extension FMPageContentView {
    fileprivate func setUpUI() {
        // 1、将所有的子控制器添加到父控制器当中
        for childVC in childVCs {
            parentVC?.addChildViewController(childVC)
        }
        // 2、添加UICollectionView用于在cell中存放控制器的view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MARK - UICollectionViewDataSource
extension FMPageContentView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellIdentifier, for: indexPath)
        
        for view in cell.contentView.subviews {  // 避免复用时被添加多次
            view.removeFromSuperview()
        }
        
        let childVC = childVCs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        
        return cell
    }
}

// MARK - UICollectionViewDelegate
extension FMPageContentView: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}

// MARK - 对外暴露的方法
extension FMPageContentView {
    func setCurrentIndex(currentIndex: Int) {
//        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
//        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
        let indexPath = NSIndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionViewScrollPosition.left, animated: false)
    }
}







