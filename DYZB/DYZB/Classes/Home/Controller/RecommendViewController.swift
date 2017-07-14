//
//  RecommendViewController.swift
//  DYZB
//
//  Created by fm on 2017/7/14.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

private let kItemGap: CGFloat = 10
private let kItemW: CGFloat = (kScreenW - 3 * kItemGap)/2
private let kItemH: CGFloat = kItemW * 3 / 4
private let kHeaderViewH: CGFloat = 50

private let kNormalCellIdentifier: String = "kNormalCellIdentifier"

class RecommendViewController: UIViewController {
    
    // MARK - 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: kItemW, height: kItemH)
//        layout.minimumLineSpacing = 0 // 行间距
//        layout.minimumInteritemSpacing = kItemGap // item之间的间距
//        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellIdentifier)
        // 设置UI界面
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK - 设置UI界面
extension RecommendViewController {
    fileprivate func setUpUI() {
        view.addSubview(collectionView)
    }
}

// MARK - UICollectionViewDataSource
extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellIdentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
}

// MARK - UICollectionViewDelegateFlowLayout
extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: kItemGap, bottom: 0, right: kItemGap)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kItemW, height: kItemH)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kItemGap
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kItemGap
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: kScreenW, height: kHeaderViewH)
    }
}












