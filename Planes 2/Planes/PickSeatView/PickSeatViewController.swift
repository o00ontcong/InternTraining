//
//  PickSeatViewController.swift
//  FlyProject
//
//  Created by Nguyen Hung Thanh Liem on 2/18/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit

class PickSeatViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var MainUIView: UIView!
    @IBOutlet weak var selectedSeatsLabel: UILabel!
    @IBOutlet weak var typeOfSeatButton: UIButton!
    @IBAction func pushToEticket(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Eticket", bundle: nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "Eticket") as! EticketViewController
        self.present(balanceViewController, animated: true, completion: nil)
    }
    
    @IBAction func pressBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var busisnessSeats=["1A","1B","1C","1D","1E","1F",
                        "2A","3B","2C","2D","2E","2F",
                        "3A","3B","3C","3D","3E","3F"]
    
    var economySeats=["11A","11B","11C","11D","11E","11F",
                      "12A","13B","12C","12D","12E","12F",
                      "13A","13B","13C","13D","13E","13F",
                      "14A","14B","14C","14D","14E","14F",
                      "15A","15B","15C","15D","15E","15F",
                      "16A","16B","16C","16D","16E","16F"]
    
    var classSections =  ["Business Class","Economy Class"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = (MainUIView.frame.width-30) / 6
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: size, height: size)
        
        selectedSeatsLabel.text="Select some seats"
        
        collectionView.showsVerticalScrollIndicator=false
        collectionView.showsHorizontalScrollIndicator=false
        collectionView.backgroundColor = UIColor.clear;
        collectionView?.allowsMultipleSelection = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Collection Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 && busisnessSeats.count > 0{
            return busisnessSeats.count
        }
        else if section == 1 && economySeats.count > 0{
            return economySeats.count
        }
        else{
            return 0
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.classSections.count
    }
    
    //Cell Content
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SeatCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "seatcell", for: indexPath) as! SeatCollectionViewCell
        cell.seatButton.contentHorizontalAlignment = .fill
        cell.seatButton.contentVerticalAlignment = .fill
        cell.seatButton?.contentMode = .scaleAspectFit
        
        if (indexPath.row % 6) == 2{
            cell.addDashedBorder()
        }
        
        if indexPath.section==0 {
            cell.seatButton.setImage(#imageLiteral(resourceName: "EmptySeat"), for: UIControlState.normal)
            cell.seatButton.setImage(#imageLiteral(resourceName: "Selected-Seat"), for: UIControlState.selected)
            cell.seatButton.setImage(#imageLiteral(resourceName: "Booked-Seat"), for: UIControlState.highlighted)
        }else if indexPath.section==1{
            cell.seatButton.setImage(#imageLiteral(resourceName: "EmptySeat"), for: UIControlState.normal)
            cell.seatButton.setImage(#imageLiteral(resourceName: "Selected-Seat"), for: UIControlState.selected)
            cell.seatButton.setImage(#imageLiteral(resourceName: "Booked-Seat"), for: UIControlState.highlighted)
        }
        return cell
    }
    //Selected Action
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        if indexPath.section == 0 {
//            selectedSeatsLabel.text += busisnessSeats[indexPath.row]
//        }
//        else if indexPath.section == 1{
//             selectedSeatsLabel.text += economySeats[indexPath.row]
//        }
//
    }
    //Header Title
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderview: SectionHeaderCollectionReusableView? = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView)
        if sectionHeaderview != nil{
            if indexPath.section==0 {
                sectionHeaderview!.headerLabel.text=classSections[0]
            }else if indexPath.section==1{
                sectionHeaderview!.headerLabel.text=classSections[1]
            }
        }
        return sectionHeaderview!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//Mid line shape
extension UIView {
    
    func addDashedBorder() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [8]
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: self.frame.width, y: 0),
                                CGPoint(x: self.frame.width, y: self.frame.height)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
   


