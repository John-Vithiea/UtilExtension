//
//  LabelExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/12/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import UIKit

extension UILabel {
    /// Call this method to underline all text inside label
    public func underlineText() {
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle:NSUnderlineStyle.styleSingle.rawValue
        ]
        
        self.attributedText = NSAttributedString(string: self.text!, attributes: attributes)
    }
    
    /// Call this method to set line spacing.
    /// - Parameter space: The number of spacing. Default is 2.0
    public func setLineSpace(_ space: CGFloat = 2.0) {
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}
