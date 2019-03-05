//
//  PhoneViewController.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/4/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"

@interface PhoneViewController : UIViewController
- (IBAction)didPressCloseButton:(id)sender;

-(void)openConnection;
-(void)createTable;

@end
