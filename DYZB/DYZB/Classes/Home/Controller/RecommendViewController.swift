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

private let kSectionHeaderIdentifier = "kSectionHeaderIdentifier"

class RecommendViewController: UIViewController {
    
    // MARK - 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellIdentifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kSectionHeaderIdentifier)
        return collectionView
    }()
    
    // MARK - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1、取出section的headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kSectionHeaderIdentifier, for: indexPath)
        headerView.backgroundColor = UIColor.yellow
        return headerView
    }
}

extension RecommendViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("*** didSelected at index: \(indexPath.section)-\(indexPath.item)")
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












