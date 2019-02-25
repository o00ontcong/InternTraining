//
//  EticketCardView.swift
//  Swift-oC
//
//  Created by Nguyen Hung Thanh Liem on 2/21/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//

import UIKit

class EticketCardView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet var numberOfTicketsLabel: UILabel!
    @IBOutlet var classButton: UIButton!
    @IBOutlet var toDestinationLabel: UILabel!
    @IBOutlet var fromLocationLabel: UILabel!
    @IBOutlet var barcodeImage: UIImageView!
    @IBOutlet var seatLabel: UILabel!
    @IBOutlet var gateLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var seatClassLabel: UILabel!
    @IBOutlet var flightCodeLabel: UILabel!
    @IBOutlet var passengerNameLabel: UILabel!
    @IBOutlet var barCodeValue: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TicketCardView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }}
