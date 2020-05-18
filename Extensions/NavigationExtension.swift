//
//  NavigationExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/12/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import UIKit


// MARK: - Navigation Controller
extension UINavigationController {
    
    public func enableTranparent() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
    public func disableTranparent(barColor:UIColor) {
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.shadowImage = nil
        self.navigationBar.barTintColor = barColor
        self.navigationBar.isTranslucent = false
    }
}

// MARK: - Navigation Item
extension UINavigationItem {
    
    /// Create a label and sets its title on navigation item title view.
    public func setTitle(_ title:String, color:UIColor, font:UIFont) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        label.text = title
        label.font = font
        label.textColor = color
        self.titleView = label
    }
}
