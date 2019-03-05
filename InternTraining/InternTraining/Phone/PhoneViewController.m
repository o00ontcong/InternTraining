//
//  PhoneViewController.m
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/4/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "PhoneViewController.h"

@interface PhoneViewController ()

@end

@implementation PhoneViewController

    NSString *path;
    NSString *databaseName = @"Phone.db";
    FMDatabase *db;
    NSString *tableQueue= @"CREATE TABLE IF NOT EXISTS phone_master (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,type INTEGER,description TEXT, status BOOLEAN ,price INTEGER)";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: Open Connection;
    [self openConnection];
    
//MARK: Create Table
    [self createTable];
    
    
}//End vỉewDidLoad

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)didPressCloseButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)openConnection{
    path = [NSTemporaryDirectory() stringByAppendingPathComponent:databaseName];
    db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        db = nil;
        printf("DB Open Error %s\n", [[db lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
};
-(void)createTable{
    BOOL createTableresult = [db executeUpdate:tableQueue];
    if (!createTableresult) {
        printf("Create table error = %s\n", [[db lastErrorMessage] UTF8String]);
    }
    else{
        printf("Create table OK!\n");
    }
}

@end
