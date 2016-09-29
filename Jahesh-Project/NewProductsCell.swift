//
//  NewProductsCell.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/7/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit

class NewProductsCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageVIew: UIImageView!
    var initialized: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.initialize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.titleLabel.text = "لامپ"
        self.layer.cornerRadius = 5
        self.imageVIew.layer.cornerRadius = 5
        
    }
    
    func initialize() {
        if !initialized {
            initialized = true
        }
    }
}
