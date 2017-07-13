//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by fm on 2017/7/13.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    
}
