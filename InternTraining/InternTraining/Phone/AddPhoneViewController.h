//
//  AddPhoneViewController.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/5/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"

@interface AddPhoneViewController : UIViewController
- (IBAction)didPressCloseButton:(id)sender;
- (IBAction)didPressAddButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusSegmented;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@end
