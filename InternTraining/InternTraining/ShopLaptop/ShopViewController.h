//
//  ShopViewController.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import "ShopDatabase.h"
#import "ShopTableViewCell.h"
@interface ShopViewController : UIViewController




-(void)openConnection;
-(void)createTable;


@end
