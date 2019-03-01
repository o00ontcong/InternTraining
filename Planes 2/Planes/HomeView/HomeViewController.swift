//
//  HomeViewController.swift
//  FlyProject
//
//  Created by Pham Anh Tuan on 1/25/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit
struct Item {
    var imageName: String
}
class HomeViewController: UIViewController{
    enum Mode {
        case view
        case select
    }
    
    @IBOutlet weak var btnFlight: UIButton!
    
    @IBOutlet weak var btnHotel: UIButton!
    
    @IBOutlet weak var btnTrain: UIButton!
    
    @IBOutlet weak var btnBus: UIButton!
    
    @IBOutlet weak var btnMovies: UIButton!
    
    @IBOutlet weak var btnAttractions: UIButton!
    
    @IBOutlet weak var btnTaxi: UIButton!
    
    @IBOutlet weak var btnEats: UIButton!
    
    //-----
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //-----
    //-----
    var items: [Item] = [Item(imageName: "i1"),
                         Item(imageName: "r1"),
                         Item(imageName: "r2"),
                         Item(imageName: "r3"),
                         Item(imageName: "i2"),
                         Item(imageName: "i3"),
                         Item(imageName: "r3"),
                         Item(imageName: "r4"),
                         Item(imageName: "r5"),
                         Item(imageName: "r6"),
                         Item(imageName: "r7"),
                         Item(imageName: "i5"),
                         Item(imageName: "i6"),
                         Item(imageName: "i7"),
                         Item(imageName: "i8"),
                         Item(imageName: "i9"),
                         Item(imageName: "i10"),
                         Item(imageName: "i11"),
                         Item(imageName: "r8")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"
    
    
    
    
    
    lazy var deleteBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didDeleteButtonClicked(_:)))
        return barButtonItem
    }()
    
    var dictionarySelectedIndecPath: [IndexPath: Bool] = [:]
    
    let lineSpacing: CGFloat = 5
    let interItemSpacing: CGFloat = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupCollectionViewItemSize()
        //-----
//       createTabBarController()
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
//    func createTabBarController() {
//        let tabBarCnt = UITabBarController()
//        tabBarCnt.tabBar.tintColor = UIColor.black
//
//        let firstVc = UIViewController()
//        firstVc.title = "First"
//        firstVc.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "home"), tag: 0)
//        let secondVc = FavoriteViewController()
//        secondVc.title = "Second"
//        secondVc.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "profile"), tag: 1)
//
//        tabBarCnt.viewControllers = [firstVc, secondVc]
////        let controllerArray = [firstVc, secondVc]
////        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
////
//
//
//        self.view.addSubview(tabBarCnt.view)
//    }
    //***** MyImage
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let item = sender as! Item
//
//        if segue.identifier == viewImageSegueIdentifier {
//            if let vc = segue.destination as? ImageViewerViewController {
//                vc.imageName = item.imageName
//            }
//        }
//    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        let customLayout = CustomLayout()
        customLayout.delegate = self
        collectionView.collectionViewLayout = customLayout
    }
    
   
    
    @objc func didDeleteButtonClicked(_ sender: UIBarButtonItem) {
        var deleteNeededIndexPaths: [IndexPath] = []
        for (key, value) in dictionarySelectedIndecPath {
            if value {
                deleteNeededIndexPaths.append(key)
            }
        }
        
        for i in deleteNeededIndexPaths.sorted(by: { $0.item > $1.item }) {
            items.remove(at: i.item)
        }
        
        collectionView.deleteItems(at: deleteNeededIndexPaths)
        dictionarySelectedIndecPath.removeAll()
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
            collectionView.deselectItem(at: indexPath, animated: true)
            let item = items[indexPath.item]
            performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
            dictionarySelectedIndecPath[indexPath] = false
        
    }
    
}

extension HomeViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: items[indexPath.item].imageName)!.size
    }
}

    
    //***** Collection-View
    

