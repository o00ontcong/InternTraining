//
//  AddLaptopViewController.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
@interface AddLaptopViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameAddLaptop;
@property (weak, nonatomic) IBOutlet UITextField *priceAddLaptop;
@property (weak, nonatomic) IBOutlet UITextField *cpuAddLaptop;
@property (weak, nonatomic) IBOutlet UITextField *ramAddLaptop;
@property (weak, nonatomic) IBOutlet UISegmentedControl *hdhAddLaptop;
@property (weak, nonatomic) IBOutlet UITextField *hddAddLaptop;


@end
