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




NSString *pathLaptop;
NSMutableArray *laptops;
NSString *databaseShop = @"StoreLatop.db";
FMDatabase *laptopdb;
NSString *tableQueueShop= @"CREATE TABLE IF NOT EXISTS TBStore (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,price INTEGER, cpu TEXT ,ram INTEGER,hdh BOOLEAN,HDD INTEGER)";

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
    //MARK: Get tabledata
    if(!laptops) laptops = [[NSMutableArray alloc] init];
    [self getAllFromShop];
    
    //Query
    [self queryPriceOver10m];
    [self queryRamOver2gb_CPUCoreI5];
    [self queryHDH_HDDOver500gb_PriceOver10m];
    
    
}
#pragma mark - OpenConnection
-(void)openConnection{
    pathLaptop = [NSTemporaryDirectory() stringByAppendingPathComponent:databaseShop];
    laptopdb = [FMDatabase databaseWithPath:pathLaptop];
    if (![laptopdb open]) {
        laptopdb = nil;
        printf("DB Open Error %s\n", [[laptopdb lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
};
-(void)createTable{
    BOOL createTableresult = [laptopdb executeUpdate:tableQueueShop];
    if (!createTableresult) {
        printf("Create table error = %s\n", [[laptopdb lastErrorMessage] UTF8String]);
    }
    else{
        printf("Create table OK!\n");
    }
}
-(void)queryPriceOver10m{
    NSString *query10m = @"select id,name,price,cpu,ram,hdh,hdd from TBStore where price > 10000000";
    FMResultSet *twentyMilionResultSet = [laptopdb executeQuery:query10m];
    
    if ([twentyMilionResultSet next]) {
        do {
            NSLog(@" 10000000 ResultSet  %@",[twentyMilionResultSet resultDictionary]);
        } while ([twentyMilionResultSet next]);
    }
    else {
        printf("No Price > 10000000 found\n");
    }
};
-(void)queryRamOver2gb_CPUCoreI5{
    NSString *queryRC =@"select id,name,price,cpu,ram,hdh,hdd from TBStore WHERE (ram > 2 AND cpu LIKE 'i5')";
    FMResultSet *queryRCResultSet = [laptopdb executeQuery:queryRC];
    if ([queryRCResultSet next]) {
        do {
            NSLog(@"queryRC ResultSet  %@",[queryRCResultSet resultDictionary]);
        } while ([queryRCResultSet next]);
    }
    else {
        printf("No queryRC found\n");
    }
};
-(void)queryHDH_HDDOver500gb_PriceOver10m{
    NSString *queryPrice10m = @"select id,name,price,cpu,ram,hdh,hdd from TBStore Where (hdh = 0 AND hdd > 500 AND price > 10000000)";
    FMResultSet *queryPrice10mResultSet = [laptopdb executeQuery:queryPrice10m];
    if ([queryPrice10mResultSet next]) {
        do {
            NSLog(@"HDH_HDDOver500gb_PriceOver10m ResultSet %@",[queryPrice10mResultSet resultDictionary]);
        } while ([queryPrice10mResultSet next]);
    }
    else {
        printf("No HDH_HDDOver500gb_PriceOver10m found\n");
    }
};

#pragma mark - getResultSetValue
-(ShopDatabase *)getResultSetValueWith:(FMResultSet *)result{
    NSInteger laptopId = [result intForColumn:@"id"];
    NSString *name = [result stringForColumn:@"name"];
    NSInteger price = [result intForColumn:@"price"];
    NSString *cpu = [result stringForColumn:@"cpu"];
    NSInteger ram = [result intForColumn:@"ram"];
    Boolean hdh = [result boolForColumn:@"hdh"];
    NSInteger hdd = [result intForColumn:@"hdd"];
    return [[ShopDatabase alloc] initWithId:&laptopId name:name price:&price cpu:cpu ram:&ram hdh:&hdh hdd:&hdd];
};

-(void)getAllFromShop{
    if(!laptops) laptops = [[NSMutableArray alloc] init];
    NSString *query =@"select * from TBStore ";
    FMResultSet *resultSet = [laptopdb executeQuery:query];
    if ([resultSet next]) {
        do {
            [laptops addObject: [self getResultSetValueWith:resultSet]];
        } while ([resultSet next]);
    }
    else {
        printf("No Data found\n");
    }
};
@end
