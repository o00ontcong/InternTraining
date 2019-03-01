//
//  HomeViewController.swift
//  FlyProject
//
//  Created by Pham Anh Tuan on 1/25/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var btnFlight: UIButton!
    
    @IBOutlet weak var btnHotel: UIButton!
    
    @IBOutlet weak var btnTrain: UIButton!
    
    @IBOutlet weak var btnBus: UIButton!
    
    @IBOutlet weak var btnMovies: UIButton!
    
    @IBOutlet weak var btnAttractions: UIButton!
    
    @IBOutlet weak var btnTaxi: UIButton!
    
    @IBOutlet weak var btnEats: UIButton!
    
    //-----
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    @IBOutlet weak var collectionView2: UICollectionView!
   
    @IBOutlet weak var collectionView3: UICollectionView!
    //-----
    var scrollingTimer = Timer()
    //-----
    var dataArray:[String] = ["i1","i2","i3","i4"]
    var dataArray2:[String] = ["r1","r2","r3","r4"]
    var dataArray3:[String] = ["r5","r6","r7","r8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //-----
        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView2.delegate = self
        collectionView2.dataSource = self
        collectionView3.delegate = self
        collectionView3.dataSource = self
        collectionView1.isPagingEnabled = true
        collectionView2.isPagingEnabled = true
        collectionView3.isPagingEnabled = true
        //-----
        
    }
    
    
    
    
    //*****Alert
    
    
    @IBAction func alertHotel(_ sender: Any) {
        AlertHome()
    }
    @IBAction func alertTrain(_ sender: Any) {
        AlertHome()
    }
    
    @IBAction func alertBus(_ sender: Any) {
        AlertHome()
    }
    
    @IBAction func alertMovies(_ sender: Any) {
        AlertHome()
    }
    
    @IBAction func alertAttractions(_ sender: Any) {
        AlertHome()
    }
    @IBAction func alertTaxi(_ sender: Any) {
        AlertHome()
    }
    
    @IBAction func alertEats(_ sender: Any) {
        AlertHome()
    }
    //***** Change Image
    
    //***** MyAlert
    func AlertHome() {
        let myalert = UIAlertController(title: "Thông báo", message: "Dịch vụ chưa hoạt động", preferredStyle: UIAlertControllerStyle.alert)
        
        myalert.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            print("Selected")
        })
        myalert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            print("Cancel")
        })
        
        self.present(myalert, animated: true)
    }
    
    //***** MyImage
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionView1:
            return dataArray.count
        case collectionView2:
            return dataArray2.count
        case collectionView3:
            return dataArray3.count
        default:
            return 0
        }
        
    }
    @objc func startTimer(theTimer:Timer)  {
        UIView.animate(withDuration: 1.0,delay: 0,options: .curveEaseOut , animations: {
            self.collectionView1.scrollToItem(at: IndexPath (row: theTimer.userInfo! as! Int,section: 0),at:  .centeredHorizontally, animated: false)
        },completion: nil)
    }
    
    //***** Collection-View
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == collectionView1) {
            let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
            
            cell.myImage.image = UIImage(named: dataArray[indexPath.row])
            
            var  rowIndex = indexPath.row
            let numberOfrecords: Int = self.dataArray.count - 1
            if(rowIndex < numberOfrecords){
                rowIndex += 1

            }else{
                rowIndex = 0
            }
            scrollingTimer = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector (HomeViewController.startTimer(theTimer:)),userInfo: rowIndex, repeats: false)
            return cell
            
        } else if (collectionView == collectionView2) {
            
            let cell: CustomCollectionViewCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! CustomCollectionViewCell2
            
            cell.myImage2.image = UIImage(named: dataArray2[indexPath.row])
            
            
            return cell
            
        } else if (collectionView == collectionView3) {
            
            let cell: CustomCollectionViewCell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as! CustomCollectionViewCell3
            
            cell.myImage3.image = UIImage(named: dataArray3[indexPath.row])
            return cell
            
        }
        else{
            
            return UICollectionViewCell()
        }
    }
}
