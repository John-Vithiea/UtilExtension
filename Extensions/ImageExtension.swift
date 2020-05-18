//
//  ImageExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/14/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import UIKit

extension UIImage{
    
    /// Call this method to set tint color of image png
    /// - Parameter color: The color to set of image
    /// - Returns: Return an image with give color
    public func color(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()

        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        context.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return newImage
    }
    
    
}
