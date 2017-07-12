//
//  HomeViewController.swift
//  DYZB
//
//  Created by fm on 2017/7/12.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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

// MARK - 
extension HomeViewController {
    fileprivate func setUpUI() {
        // 1、不需要调整Scrollview的内边距
        automaticallyAdjustsScrollViewInsets = false
        // 2、设置导航栏
        setUpNavigationBar()
        
    }
    
    fileprivate func setUpNavigationBar() {
        // 1、设置左侧item
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "logo")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(logoAction))
        
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
