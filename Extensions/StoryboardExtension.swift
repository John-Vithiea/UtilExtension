//
//  StoryboardExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/13/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import UIKit

fileprivate let MAIN_STORYBOARD = "UIMainStoryboardFile"
fileprivate let iPHONE_STORYBOARD = "UIMainStoryboardFile~iphone"
fileprivate let iPAD_STORYBOARD = "UIMainStoryboardFile~ipad"

extension UIStoryboard {
    
    /// Return file base name of storyboard for iPhone or iPad from Info.plist. Return nil if no specific storyboard was defined.
    private static var boardName:String? = {
        switch UIDevice.current.userInterfaceIdiom{
        case .phone: return Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile~iphone") as? String
        case .pad: return Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile~ipad") as? String
        default: return nil
        }
    }()
    
    /// The shared storyboard object for the process. This will return same base storyboard which is defined in info.plist.
    public static let `default`:UIStoryboard = {
        guard let _ = boardName else {
            // user has not defined specific storyboard which is using main storyboard instead.
            let mainName = Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String
            return UIStoryboard(name: mainName ?? "", bundle: Bundle.main)
        }
        
        // user has defined a specific storyboard name whether for iPhone or iPad
        return UIStoryboard(name: boardName!, bundle: Bundle.main)
    }()
}
