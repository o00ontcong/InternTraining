//
//  ViewController.swift
//  TableView-Swift
//
//  Created by Nguyen Hung Thanh Liem on 1/17/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var myTable: UITableView!
    var myarray:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource=self
        myarray=["Android","PHP","IOS","Ruby"]
        
    }

    //TableView methods


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TableCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! DONGTableViewCell
        //Set view data
        cell.imgHinh.image=UIImage (named: "images")
        cell.myLabel.text=myarray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

