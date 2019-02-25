//
//  SeatCollectionViewCell.swift
//  FlyProject
//
//  Created by Nguyen Hung Thanh Liem on 2/18/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var seatButton: UIButton!
    
    @IBAction func changeSeatImage(_ sender: UIButton) {
        
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "EmptySeat"){
            sender.setImage(#imageLiteral(resourceName: "Booked-Seat"), for: UIControlState.normal)
        } else if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Booked-Seat"){
            sender.setImage(#imageLiteral(resourceName: "Selected-Seat"), for: UIControlState.normal)
        }  else if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Selected-Seat"){
            sender.setImage(#imageLiteral(resourceName: "EmptySeat"), for: UIControlState.normal)
        }    }
    
}
