//
//  ShopViewController.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import "ShopTableViewCell.h"
#import "Laptop.h"
@interface ShopViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


-(void)openConnection;
-(void)createTable;
-(void)queryPriceOver10m;
-(void)queryRamOver2gb_CPUCoreI5;
-(void)queryHDH_HDDOver500gb_PriceOver10m;

@end
