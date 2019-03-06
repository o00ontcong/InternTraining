//
//  ShopViewController.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/6/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import "ShopDatabase.h"
#import "ShopTableViewCell.h"
@interface ShopViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>




-(void)openConnection;
-(void)createTable;
-(void)queryLevel2;
-(void)queryStatus1;
-(void)queryHCM_Type2_Status1;

@end

