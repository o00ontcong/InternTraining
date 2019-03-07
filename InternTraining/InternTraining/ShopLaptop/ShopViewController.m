//
//  ShopViewController.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//


#import "ShopViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController




NSString *pathShop;
NSMutableArray *shops;
NSString *databaseShop = @"ShopLatop.db";
FMDatabase *shopdb;
NSString *tableQueueShop= @"CREATE TABLE IF NOT EXISTS shopLaptop (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,price INTEGER, cpu TEXT ,hdh TEXT,HDD TEXT)";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}//End vỉewDidLoad

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    //MARK: Open Connection;
    [self openConnection];
    
    //MARK: Create Table
    
    [self createTable];
    
    
}

#pragma mark - Query
-(void)openConnection{
    pathShop = [NSTemporaryDirectory() stringByAppendingPathComponent:databaseShop];
    shopdb = [FMDatabase databaseWithPath:pathShop];
    if (![shopdb open]) {
        shopdb = nil;
        printf("DB Open Error %s\n", [[shopdb lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
};
-(void)createTable{
    BOOL createTableresult = [shopdb executeUpdate:tableQueueShop];
    if (!createTableresult) {
        printf("Create table error = %s\n", [[shopdb lastErrorMessage] UTF8String]);
    }
    else{
        printf("Create table OK!\n");
    }
}

@end
