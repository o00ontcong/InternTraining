//
//  PhoneCollectionViewCell.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/5/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *phoneNameText;
@property (weak, nonatomic) IBOutlet UILabel *priceText;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImageView;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *decriptionText;
@property (weak, nonatomic) IBOutlet UILabel *statusText;

@end
