//
//  SearchTableViewCell1.swift
//  FlyProject
//
//  Created by Pham Anh Tuan on 2/15/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit

class SearchTableViewCell1: UITableViewCell {

        @IBOutlet weak var titleCellLabel1: UILabel!
        @IBOutlet weak var imageCellView1: UIImageView!
    

    @IBOutlet weak var dropBtn: UIDropDown!
    
    
    func setImage1(imagecell1: SearchCell1 ){
            
            imageCellView1.image = imagecell1.image
            titleCellLabel1.text = imagecell1.title
            dropBtn.addTarget(self, action: #selector (SearchTableViewCell1.Change(_:)), for: .touchUpInside)
        
        
}
    
    @objc func Change(_ sender: Any) {
        
        dropBtn.didSelect { (option, index) in }
    }
}

