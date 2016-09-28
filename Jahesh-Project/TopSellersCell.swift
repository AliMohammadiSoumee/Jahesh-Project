//
//  TopSellersCell.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/7/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit

class TopSellersCell: UICollectionViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("ali")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
//    override init(frame: CGRect) {
//        priceLabel.text = "cool!"
//        titleLabel.text = "shit!"
//        imageView.image = UIImage(named: "Gheyme")
//        super.init(frame: frame)
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//    }
    
}

