//
//  ShopTableViewCell.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/6/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell {
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imageShop;
@property (weak, nonatomic) IBOutlet UILabel *nameShop;
@property (weak, nonatomic) IBOutlet UILabel *addressShop;
@property (weak, nonatomic) IBOutlet UILabel *statusShop;
@property (weak, nonatomic) IBOutlet UILabel *typeShop;
@property (weak, nonatomic) IBOutlet UILabel *levelShop;

@end
