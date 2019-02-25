//
//  Ticket.swift
//  Swift-oC
//
//  Created by Nguyen Hung Thanh Liem on 2/21/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//


import UIKit

struct  Ticket: Hashable {
    
    let fromLocation: String
    let toDestination: String
    let numberoOfTickets: IntegerLiteralType
    let passengerName: String
    let flightCode:String
    let seatClass: String
    let date: String
    let gate: String
    let seat: String
    let barcodeValue: String
    var barcodeImage: UIImage {
        return UIImage(named: barcodeValue)!
    }
    
}
