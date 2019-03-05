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
    FMDatabase *phonedb;
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

- (IBAction)didPressAddButton:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Phone" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"AddPhoneViewController"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}

-(void)openConnection{
    path = [NSTemporaryDirectory() stringByAppendingPathComponent:databaseName];
    phonedb = [FMDatabase databaseWithPath:path];
    if (![phonedb open]) {
        phonedb = nil;
        printf("DB Open Error %s\n", [[phonedb lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
};
-(void)createTable{
    BOOL createTableresult = [phonedb executeUpdate:tableQueue];
    if (!createTableresult) {
        printf("Create table error = %s\n", [[phonedb lastErrorMessage] UTF8String]);
    }
    else{
        printf("Create table OK!\n");
    }
}
-(void)queryPrice20Milion{
};
-(void)queryStatus1{
    
};
-(void)queryDecription2Sim_Type2_Status1{
    
};

@end
