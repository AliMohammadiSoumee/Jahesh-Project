//
//  TreeTableViewCell.swift
//  RATreeViewExamples
//
//  Created by Rafal Augustyniak on 22/11/15.
//  Copyright © 2015 com.Augustyniak. All rights reserved.
//

import UIKit

class TreeTableViewCell : UITableViewCell {

    let detailsLabel = UILabel()
    let customTitleLabel = UILabel()

    func setup(withTitle title: String, detailsText: String, level : Int) {
        
        customTitleLabel.textAlignment = .right
        customTitleLabel.text = title
        detailsLabel.text = detailsText

        if level == 0 {
            self.backgroundColor? = UIColor.init(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        } else if level == 1 {
            self.backgroundColor? = UIColor.init(red: 209.0/255.0, green: 238.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        } else {
            self.backgroundColor? = UIColor.init(red: 224.0/255.0, green: 248.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        }

        let right = 11.0 + 20.0 * CGFloat(level)
        setTitle(right: right)
    }
    
    
    func setTitle(right: CGFloat){
        let topConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .top
            , relatedBy: .equal
            , toItem: self
            , attribute: .top
            , multiplier: 1
            , constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .bottom
            , relatedBy: .equal
            , toItem: self
            , attribute: .bottom
            , multiplier: 1
            , constant: 0)
        let rightConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .right
            , relatedBy: .equal
            , toItem: self
            , attribute: .right
            , multiplier: 1
            , constant: -right)
        let leftConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .left
            , relatedBy: .equal
            , toItem: self
            , attribute: .left
            , multiplier: 1
            , constant: 0)
        let heightConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .height
            , relatedBy: .equal
            , toItem: nil
            , attribute: .notAnAttribute
            , multiplier: 1
            , constant: 50)
        
        self.addSubview(customTitleLabel)
        customTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint, heightConstraint])
    }
}
