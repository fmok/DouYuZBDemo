//
//  HomeViewController.swift
//  DYZB
//
//  Created by fm on 2017/7/12.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    
    // MARK - 懒加载属性
    fileprivate lazy var pageTitleView: FMPageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = FMPageTitleView(frame: titleFrame, titles: titles)
        titleView.backgroundColor = UIColor.white
        return titleView
    }()
    
    fileprivate lazy var pageContentView: FMPageContentView = {
        // 1、frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        // 2、子控制器
        var childVCs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVCs.append(vc)
        }
        let pageContentView = FMPageContentView(frame: contentFrame, childVCs: childVCs, parentViewController: self)
        pageContentView.backgroundColor = UIColor.purple
        return pageContentView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置UI界面
        setUpUI()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK - 设置UI界面
extension HomeViewController {
    fileprivate func setUpUI() {
        // 0、不需要调整Scrollview的内边距
        automaticallyAdjustsScrollViewInsets = false
        // 1、设置导航栏
        setUpNavigationBar()
        // 2、添加titleView
        view.addSubview(pageTitleView)
        // 3、添加contentView
        view.addSubview(pageContentView)
    }
    
    fileprivate func setUpNavigationBar() {
        // 1、设置左侧item
        let logoItem = UIBarButtonItem(imageName: "logo", highImageName: "", size: CGSize.zero, target: self, action: #selector(logoAction))
        navigationItem.leftBarButtonItem = logoItem
        
        // 2、设置右侧item
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size, target: self, action: #selector(historyAction))
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size, target: self, action: #selector(searchAction))
        let qrCodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size, target: self, action: #selector(qrCodeAction))
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrCodeItem]
    }
    
    @objc fileprivate func logoAction() {
        print("click logo")
    }
    
    @objc fileprivate func historyAction() {
        print("click history")
    }
    
    @objc fileprivate func searchAction() {
        print("click search")
    }
    
    @objc fileprivate func qrCodeAction() {
        print("click qrCode")
    }
}
