//
//  EticketViewController.swift
//  FlyProject
//
//  Created by Nguyen Hung Thanh Liem on 2/18/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit
import CoreGraphics

class EticketViewController: UIViewController ,BSStackViewProtocol{
    @IBOutlet var point1: UIImageView!
    @IBOutlet var point2: UIImageView!
    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var myBSStackView: BSStackView!
    var moveAlongPath:CAAnimation!
    
    struct  TicketDetail {
        let numberOfTicket:String
        let fromLocation:String
        let toDestination: String
        let passengerName:String
        let flightCode:String
        let seatClass:String
        let date: String
        let gate: String
        let seat: String
        let barCode:UIImage
        let barCodeValue:String
    }
    
    var TicketDetails:[TicketDetail] = []
    
    var views:[UIView] = []
    
    override func viewWillAppear(_ animated: Bool) {
        addAnimation()
        initiateAnimation()
        addViewtoBSStackView(with: TicketDetails)
        setupBSStackViewSwipeDirections()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initTicketDetails()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //****** Animation-Planes
    
    
    //****** UIBezierPath
    func curevedPath() -> UIBezierPath {
        
        let path = createCurvePath()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.lineDashPattern = [6,2]
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 5.0
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.speed = 0.2
        pathAnimation.repeatCount = 0
        
        shapeLayer.add(pathAnimation, forKey: "strokeEndAnimation")
        
        self.view.layer.addSublayer(shapeLayer)
        return path
    }
    
    //****** Add-Animation
    func addAnimation() {
        let moveAlongPath = CAKeyframeAnimation(keyPath: "position")
        moveAlongPath.path = curevedPath().cgPath
        moveAlongPath.duration = 5
        moveAlongPath.repeatCount = 1
        
        moveAlongPath.calculationMode = kCAAnimationPaced
        moveAlongPath.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        moveAlongPath.speed = 0.2
        moveAlongPath.autoreverses = false
        
        
        
        moveAlongPath.rotationMode = kCAAnimationRotateAuto
        
        self.moveAlongPath = moveAlongPath
    }
    
    func initiateAnimation() {
        let layer = createLayer()
        layer.add(moveAlongPath, forKey: "animate along Path")
    }
    
    // Custom View Path
    func createLayer() -> CALayer {
        let customView  = CustomView(frame: CGRect(x: 0, y: 0, width: 28, height: 29))
        self.view.addSubview(customView)
        let customlayer = customView.layer
        customlayer.bounds = CGRect(x: 0, y: 0, width: 28, height: 29)
        customlayer.position = CGPoint(x: 0, y: 0)
        
        return customlayer
    }
    
    class CustomView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUpView()
        }
        
        func setUpView() {
            let image = UIImage(named: "flight")
            
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
            
            self.addSubview(imageView)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    // Custom Curve Path
    func createCurvePath() -> UIBezierPath {
        let path = UIBezierPath()
        
        
        
        let x = (point1.frame.origin.x + point2.frame.origin.x)/2
        let y = (point1.frame.origin.y + point2.frame.origin.y) / 2 - 50
        
        path.move(to: CGPoint(x: (point1.frame.origin.x + point1.frame.width / 2), y: point1.frame.origin.y + point1.frame.height / 2))
        path.addQuadCurve(to: CGPoint(x: (point2.frame.origin.x + point2.frame.width / 2 ), y: point2.frame.origin.y + point2.frame.height / 2), controlPoint: CGPoint(x: x , y: y))
        
        return path
    }
    func addViewtoBSStackView(with: [TicketDetail]){
        for index in 0...with.count-1 {
            let myView = EticketCardView(frame: CGRect(x: 0, y: 0, width: myBSStackView.frame.size.width, height:
            myBSStackView.frame.size.height))
            myView.numberOfTicketsLabel.text = with[index].numberOfTicket
            myView.fromLocationLabel.text = with[index].fromLocation
            myView.toDestinationLabel.text = with[index].toDestination
            myView.passengerNameLabel.text = with[index].passengerName
            myView.flightCodeLabel.text = with[index].flightCode
            myView.seatClassLabel.text = with[index].seatClass
            myView.dateLabel.text = with[index].date
            myView.gateLabel.text = with[index].gate
            myView.barcodeImage.image = with[index].barCode
            myView.barCodeValue.text = with[index].barCodeValue
            myView.seatLabel.text = with[index].seat
            myView.classButton.setTitle(with[index].seatClass + " class", for: UIControlState.normal)
            myView.classButton.titleLabel?.numberOfLines = 1
            myView.classButton.titleLabel?.adjustsFontSizeToFitWidth = true
            myView.classButton.titleLabel?.lineBreakMode = .byClipping
            myView.contentMode = .scaleAspectFit
            myView.layer.cornerRadius = 5.0
            views.append(myView)
        }
    }
    
    func setupBSStackViewSwipeDirections(){
        myBSStackView.swipeDirections = [UISwipeGestureRecognizerDirection.left,UISwipeGestureRecognizerDirection.right,UISwipeGestureRecognizerDirection.up,UISwipeGestureRecognizerDirection.down]
        self.myBSStackView.forwardDirections = [UISwipeGestureRecognizerDirection.right, UISwipeGestureRecognizerDirection.up]
        self.myBSStackView.backwardDirections = [UISwipeGestureRecognizerDirection.left, UISwipeGestureRecognizerDirection.down]
        self.myBSStackView.changeAlphaOnSendAnimation=true
        self.myBSStackView.configure(with: views)
        self.myBSStackView.delegate = self;
    }
    
    
    func initTicketDetails(){
        
        TicketDetails.append(TicketDetail(numberOfTicket: "4 Flight Tickets",
                                          fromLocation: "SML", toDestination: "BTL",
                                          passengerName: "Ilona",
                                          flightCode: "76836A45",
                                          seatClass: "Business",
                                          date: "24-12-2018",
                                          gate: "66 B",
                                          seat: "21 B", barCode: #imageLiteral(resourceName: "Barcode"),
                                          barCodeValue: "9824 0972 1742 1298"))
        TicketDetails.append(TicketDetail(numberOfTicket: "4 Flight Tickets",
                                          fromLocation: "SML",
                                          toDestination: "BTL",
                                          passengerName: "John Smith",
                                          flightCode: "76836A45",
                                          seatClass: "Business",
                                          date: "24-12-2018",
                                          gate: "66 B",
                                          seat: "22 B",
                                          barCode: #imageLiteral(resourceName: "Barcode"),
                                          barCodeValue: "9824 0972 1742 1298"))
        TicketDetails.append(TicketDetail(numberOfTicket: "4 Flight Tickets",
                                          fromLocation: "SML",
                                          toDestination: "BTL",
                                          passengerName: "Doctor Strange",
                                          flightCode: "76836A45",
                                          seatClass: "Business",
                                          date: "24-12-2018",
                                          gate: "66 B",
                                          seat: "23 B",
                                          barCode: #imageLiteral(resourceName: "Barcode"),
                                          barCodeValue: "9824 0972 1742 1298"))
        TicketDetails.append(TicketDetail(numberOfTicket: "4 Flight Tickets",
                                          fromLocation: "SML",
                                          toDestination: "BTL",
                                          passengerName: "Doctor Who",
                                          flightCode: "76836A45",
                                          seatClass: "Business",
                                          date: "24-12-2018",
                                          gate: "66 B",
                                          seat: "24 B",
                                          barCode: #imageLiteral(resourceName: "Barcode"),
                                          barCodeValue: "9824 0972 1742 1298"))
    }

}
