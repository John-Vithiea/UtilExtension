//
//  ApplicationManager.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/13/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import UIKit

extension UIApplication {
    public func setRootViewController(_ id: String, storyboard:UIStoryboard) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let vc = storyboard.instantiateViewController(withIdentifier: id)
            self.keyWindow?.rootViewController = vc
        }
    }
}
