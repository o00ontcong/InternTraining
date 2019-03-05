//
//  PhoneViewController.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/4/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import "Phone.h"
#import "PhoneCollectionViewCell.h"

@interface PhoneViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
- (IBAction)didPressCloseButton:(id)sender;
- (IBAction)didPressAddButton:(id)sender;


-(void)openConnection;
-(void)createTable;
-(void)queryPrice20Milion;
-(void)queryStatus1;
-(void)queryDecription2Sim_Type2_Status1;

@end
