//
//  SearchViewController.swift
//  FlyProject
//
//  Created by Pham Anh Tuan on 2/12/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit
import CoreGraphics
class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func showPickSeat(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "PickSeat", bundle: nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "PickSeat") as! PickSeatViewController
        self.present(balanceViewController, animated: true, completion: nil)
    }
    @IBOutlet weak var point1: UIImageView!
    
    @IBOutlet weak var point2: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var array: [SearchCell] = []
    var array1: [SearchCell1] = []
    var moveAlongPath:CAAnimation!
   var drop: UIDropDown!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       array = createArray()
        array1 = createArray1()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        addAnimation()
        initiateAnimation()
        
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
    

    //****** Table-View
    
    func createArray1() -> [SearchCell1] {
        var itemCell1: [SearchCell1] = []
        
        
        let item1 = SearchCell1(image:#imageLiteral(resourceName: "passenger2"),title:"Class" )
        
        itemCell1.append(item1)
        
        return itemCell1
    }
    
    
    func createArray() -> [SearchCell] {
        var itemCell: [SearchCell] = []
        
        
        let item1 = SearchCell(image: #imageLiteral(resourceName: "date"), title: "Departure Date", info: "Mon, 14 Dec")
        let item2 = SearchCell(image: #imageLiteral(resourceName: "date"), title: "Arrival Date", info: "Sun, 15 Dec")
        let item3 = SearchCell(image: #imageLiteral(resourceName: "passenger"), title: "Passenger", info: "1 Adult   0 Child   0 Infant")
        
        
        
        itemCell.append(item1)
        itemCell.append(item2)
        itemCell.append(item3)

        return itemCell
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return 4
            
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellS1") as! SearchTableViewCell1
        
        drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        
        drop.placeholder = "Business"
        drop.options = ["Business", "Economy"]
        
        cell.dropBtn.addSubview(drop)
        
            //*************
            let imagecell1 = array1[0]

            cell.setImage1(imagecell1: imagecell1)
            
            return cell
                } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellS") as! SearchTableViewCell
    
            //*************
            let imagecell = array[indexPath.row]
    
            cell.setImage(imagecell: imagecell)
            return cell


}
}
  
    }

