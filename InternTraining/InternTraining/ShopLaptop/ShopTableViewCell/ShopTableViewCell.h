//
//  ShopTableViewCell.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageLaptop;
@property (weak, nonatomic) IBOutlet UILabel *nameLatop;
@property (weak, nonatomic) IBOutlet UILabel *priceLaptop;
@property (weak, nonatomic) IBOutlet UILabel *cpuLaptop;
@property (weak, nonatomic) IBOutlet UILabel *ramLaptop;
@property (weak, nonatomic) IBOutlet UILabel *hdhLaptop;
@property (weak, nonatomic) IBOutlet UILabel *hddLaptop;

@end
