//

//  FlyProject
//
//  Created by Pham Anh Tuan on 2/13/19.
//  Copyright © 2019 Pham Anh Tuan. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCellView: UIImageView!
    @IBOutlet weak var titleCellLabel: UILabel!
    @IBOutlet weak var infoCellLabel: UILabel!
    
    
    func setImage(imagecell: SearchCell ){
        
        imageCellView.image = imagecell.image
        titleCellLabel.text = imagecell.title
        infoCellLabel.text = imagecell.info
        
        
    }


}

