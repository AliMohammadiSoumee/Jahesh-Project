//
//  TreeTableViewCell.swift
//  RATreeViewExamples
//
//  Created by Rafal Augustyniak on 22/11/15.
//  Copyright © 2015 com.Augustyniak. All rights reserved.
//

import UIKit

class TreeTableViewCell : UITableViewCell {

    let customTitleLabel = UILabel()
    let itemImage = UIImageView()
    let expandImage = UIImageView()
    let contentUIView = UIView()
    var cellExpand = false
    var level = 0
    
    func setup(withTitle title: String, level : Int) {
        
        self.level = level
        customTitleLabel.textAlignment = .right
        customTitleLabel.text = title
        customTitleLabel.font = UIFont(name: "IranianSans", size: 14)
        self.backgroundColor = UIColor.white
        contentUIView.backgroundColor = UIColor.blue
        contentUIView.layer.cornerRadius = 5
        
        if level == 0 {
            contentUIView.backgroundColor = UIColor(colorLiteralRed: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        } else if level == 1 {
            contentUIView.backgroundColor = UIColor(colorLiteralRed: 209.0/255.0, green: 238.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        } else {
            contentUIView.backgroundColor = UIColor(colorLiteralRed: 224.0/255.0, green: 248.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        }

        let right = 10.0 + 20.0 * CGFloat(level)
        constrianCell(right: right)
    }
    
    
    func constrianCell(right: CGFloat){
        
        let cellHeightConstraint = NSLayoutConstraint(item: self
            , attribute: .height
            , relatedBy: .equal
            , toItem: nil
            , attribute: .notAnAttribute
            , multiplier: 1
            , constant: 70)
        self.addConstraint(cellHeightConstraint)

        
        let contentUIViewLeftConstraint = NSLayoutConstraint(item: contentUIView
            , attribute: .left
            , relatedBy: .equal
            , toItem: self
            , attribute: .left
            , multiplier: 1
            , constant: 10)
        let contentUIViewRightConstraint = NSLayoutConstraint(item: contentUIView
            , attribute: .right
            , relatedBy: .equal
            , toItem: self
            , attribute: .right
            , multiplier: 1
            , constant: -right)
        let contentUIViewTopConstraint = NSLayoutConstraint(item: contentUIView
            , attribute: .top
            , relatedBy: .equal
            , toItem: self
            , attribute: .top
            , multiplier: 1
            , constant: 5)
        let contentUIViewBottomConstraint = NSLayoutConstraint(item: contentUIView
            , attribute: .bottom
            , relatedBy: .equal
            , toItem: self
            , attribute: .bottom
            , multiplier: 1
            , constant: -5)
        contentUIView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentUIView)
        self.addConstraints([contentUIViewBottomConstraint, contentUIViewTopConstraint, contentUIViewLeftConstraint, contentUIViewRightConstraint])
        
        
        
        let itemImageCenterConstraint = NSLayoutConstraint(item: itemImage
            , attribute: .centerY
            , relatedBy: .equal
            , toItem: contentUIView
            , attribute: .centerY
            , multiplier: 1
            , constant: 0)
        let itemImageRightConstraint = NSLayoutConstraint(item: itemImage
            , attribute: .right
            , relatedBy: .equal
            , toItem: contentUIView
            , attribute: .right
            , multiplier: 1
            , constant: -10)
        let itemImageHeightConstraint = NSLayoutConstraint(item: itemImage
            , attribute: .height
            , relatedBy: .equal
            , toItem: nil
            , attribute: .notAnAttribute
            , multiplier: 1
            , constant: 25)
        let itemImageWidthConstraint = NSLayoutConstraint(item: itemImage
            , attribute: .width
            , relatedBy: .equal
            , toItem: nil
            , attribute: .notAnAttribute
            , multiplier: 1
            , constant: 25)
        
        contentUIView.addSubview(itemImage)
        itemImage.image = UIImage(named: "Compact Camera-1")
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        contentUIView.addConstraints([itemImageCenterConstraint, itemImageRightConstraint, itemImageWidthConstraint, itemImageHeightConstraint])
        
        
        let expandImageCenterConstraint = NSLayoutConstraint(item: expandImage
            , attribute: .centerY
            , relatedBy: .equal
            , toItem: contentUIView
            , attribute: .centerY
            , multiplier: 1
            , constant: 0)
        let expandImageLeftConstraint = NSLayoutConstraint(item: expandImage
            , attribute: .left
            , relatedBy: .equal
            , toItem: contentUIView
            , attribute: .left
            , multiplier: 1
            , constant: 10)
        let expandImageHeightConstraint = NSLayoutConstraint(item: expandImage
            , attribute: .height
            , relatedBy: .equal
            , toItem: nil
            , attribute: .notAnAttribute
            , multiplier: 1
            , constant: 25)
        let expandImageWidthConstraint = NSLayoutConstraint(item: expandImage
            , attribute: .width
            , relatedBy: .equal
            , toItem: nil
            , attribute: .notAnAttribute
            , multiplier: 1
            , constant: 25)
        
        contentUIView.addSubview(expandImage)
        expandImage.image = UIImage(named: "Expand Arrow")
        if self.level == 2{
            expandImage.image = UIImage()
        }
        expandImage.translatesAutoresizingMaskIntoConstraints = false
        contentUIView.addConstraints([expandImageCenterConstraint, expandImageLeftConstraint, expandImageWidthConstraint, expandImageHeightConstraint])
        
        
        let customTitleTopConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .top
            , relatedBy: .equal
            , toItem: contentUIView
            , attribute: .top
            , multiplier: 1
            , constant: 5)
        let customTitleRightConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .right
            , relatedBy: .equal
            , toItem: itemImage
            , attribute: .left
            , multiplier: 1
            , constant: -10)
        let customTitleLeftConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .left
            , relatedBy: .equal
            , toItem: expandImage
            , attribute: .right
            , multiplier: 1
            , constant: 10)
        let customTitleBottomConstraint = NSLayoutConstraint(item: customTitleLabel
            , attribute: .bottom
            , relatedBy: .equal
            , toItem: contentUIView
            , attribute: .bottom
            , multiplier: 1
            , constant: -5)
        
        contentUIView.addSubview(customTitleLabel)
        customTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentUIView.addConstraints([customTitleLeftConstraint, customTitleRightConstraint, customTitleBottomConstraint, customTitleTopConstraint])
        
        
    }
}
