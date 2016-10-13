//
//  RecordeCell.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/22/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit

class RecordeCell: UITableViewCell {

    @IBOutlet weak var cellColor: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
