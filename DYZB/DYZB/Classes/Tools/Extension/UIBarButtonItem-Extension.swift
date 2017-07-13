//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by fm on 2017/7/13.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero, target: Any?, action:Selector?) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        
        if size == .zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        btn.addTarget(target, action: action!, for: .touchUpInside)
        
        self.init(customView: btn)
    }
    
}
