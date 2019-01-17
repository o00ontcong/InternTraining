//
//  DONGTableViewCell.swift
//  TableView-Swift
//
//  Created by Nguyen Hung Thanh Liem on 1/17/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//

import UIKit

class DONGTableViewCell: UITableViewCell {

    @IBOutlet weak var imgHinh: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
