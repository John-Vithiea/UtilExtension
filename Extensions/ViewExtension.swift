//
//  ViewExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/8/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import UIKit

extension UIView {
    
    /// rounded corner of any views either piller shape or circle
    public func rounded() {
        self.rounds(radius: self.bounds.height/2)
    }
    
    public func rounds(radius:CGFloat, borderColor: UIColor = UIColor.clear, width:CGFloat = 1.0){
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func shadow(offset:CGSize, radius:CGFloat = 1.0, opacity:Float = 0.3) {
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = false
    }
    
    public func indexPathIn(tableView:UITableView) -> IndexPath? {
        var view = self.superview
        while view != nil {
            if view!.isKind(of: UITableViewCell.self) {
                return tableView.indexPath(for: view as! UITableViewCell)
            }
            view = view!.superview
        }
        return nil
    }
    
    public func indexPathIn(collectionView:UICollectionView) -> IndexPath? {
        var view = self.superview
        while view != nil {
            if view!.isKind(of: UICollectionViewCell.self) {
                return collectionView.indexPath(for: view as! UICollectionViewCell)
            }
            view = view!.superview
        }
        return nil
    }
    
    // Constraint
    func fillParent() {
        self.constraintToView(sndView: self.superview ?? UIView(), left: 0, right: 0, top: 0, bottom: 0)
    }
    
    public func constraintToView(sndView:UIView, left:CGFloat, right:CGFloat, top:CGFloat, bottom:CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let superview = self.superview ?? UIView()
        
        // top
        superview.addConstraint(NSLayoutConstraint(item: self,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: sndView,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: top))
        // bottom
        superview.addConstraint(NSLayoutConstraint(item: self,
                                                   attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: sndView,
                                                   attribute: .bottom,
                                                   multiplier: 1.0,
                                                   constant: bottom))
        // leading
        superview.addConstraint(NSLayoutConstraint(item: self,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: sndView,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: left))
        // trailing
        superview.addConstraint(NSLayoutConstraint(item: self,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: sndView,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: right))
    }
}
