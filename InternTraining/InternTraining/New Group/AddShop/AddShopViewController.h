//
//  AddShopViewController.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/6/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
@interface AddShopViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameAddShop;
@property (weak, nonatomic) IBOutlet UITextField *typeAddShop;
@property (weak, nonatomic) IBOutlet UITextField *addressAddShop;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusAddShop;
@property (weak, nonatomic) IBOutlet UITextField *levelAddShop;

@end
