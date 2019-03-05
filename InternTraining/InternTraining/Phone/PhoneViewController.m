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
    NSMutableArray *phones;
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
-(void)viewWillAppear:(BOOL)animated{
    [self queryStatus1];
    [self queryPrice20Milion];
    [self queryDecription2Sim_Type2_Status1];
    
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
    NSString *query20m = @"select id,name,type,description,status,price from phone_master where price >= 20000000";
    FMResultSet *twentyMilionResultSet = [phonedb executeQuery:query20m];

    if ([twentyMilionResultSet next]) {
        do {
            NSLog(@" 20.000.000 ResultSet  %@",[twentyMilionResultSet resultDictionary]);
        } while ([twentyMilionResultSet next]);
    }
    else {
        printf("No Price > 20.000.000 found");
    }
};
-(void)queryStatus1{
    NSString *querystatus1 =@"select id,name,type,description,status,price from phone_master WHERE status = 1";
    FMResultSet *status1ResultSet = [phonedb executeQuery:querystatus1];
    if ([status1ResultSet next]) {
        do {
            NSLog(@"Status 1 ResultSet  %@",[status1ResultSet resultDictionary]);
        } while ([status1ResultSet next]);
    }
    else {
        printf("No Status 1 found");
    }
};
-(void)queryDecription2Sim_Type2_Status1{
    NSString *query2sim = @"select id,name,type,description,status,price from phone_master Where (status = 1 AND type = 2 AND description LIKE '%2 sim%')";
    FMResultSet *decription2SimResultSet = [phonedb executeQuery:query2sim];
    if ([decription2SimResultSet next]) {
        do {
            NSLog(@"2 Sim ResultSet %@",[decription2SimResultSet resultDictionary]);
        } while ([decription2SimResultSet next]);
    }
    else {
        printf("No 2 Sim found");
    }
};

-(Phone *)getResultSetValueWith:(FMResultSet *)result{
        NSInteger phoneId = [result intForColumn:@"id"];
        NSString *name = [result stringForColumn:@"name"];
        NSInteger type = [result intForColumn:@"type"];
        NSString *description = [result stringForColumn:@"description"];
        Boolean status = [result boolForColumn:@"status"];
        NSInteger price = [result intForColumn:@"price"];    
    
    return [[Phone alloc] initWithId:&phoneId name:name type:&type description:description status:&status price:&price];
};

@end
