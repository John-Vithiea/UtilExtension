//
//  ViewControllerExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/12/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Create the view controller with the specified identifier and initializes it with the data from the file base storyboard.
    /// - Parameter id: The identifier string that uniquely identifies the view controller in the sotryboard file.
    /// - Returns: An instance of view controller corresponding to the specified identifier string.
    public class func instance(_ id:String) -> UIViewController  {
        return UIStoryboard.default.instantiateViewController(withIdentifier: id)
    }
    
    /// Call this method to enable dismiss keyboard when tap any where on screen.
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: Helper
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
