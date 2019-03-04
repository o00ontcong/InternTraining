//
//  ViewController.m
//  InternTraining
//
//  Created by Cong Nguyen on 16/01/2019.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"
#import "Login.h"
@interface ViewController ()

@end
@implementation ViewController
NSArray<Login *> *Users;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUserData];
    
#pragma mark - Connect Database
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"LoginTest.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        db = nil;
        printf("Close Database %s\n", [[db lastErrorMessage] UTF8String]);
    }
    else {
        printf("Open Database!\n");
    }
    [db executeUpdate:@"DROP TABLE LOGIN"];
#pragma mark - Create Table
    BOOL createTable = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS Login (id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT NOT NULL,password TEXT NOT NULL, name TEXT, year INTEGER,address TEXT )"];
    if (!createTable) {
        printf("error = %s\n", [[db lastErrorMessage] UTF8String]);
    }
    else{
        printf("createTable OK!\n");
    }
    
    [db executeUpdate:@"DELETE FROM Login"];
    
#pragma mark - Insert User
    for (Login *t in Users) {
        NSDictionary *arguments = @{@"username": t.username, @"password": t.password, @"name": t.name,@"year": @(t.year) ,@"address": t.address};
        
        BOOL success = [db executeUpdate:@"INSERT INTO Login (username,password,name,year,address) VALUES (:username,:password,:name,:year,:address)" withParameterDictionary:arguments];
        if (!success) {
            printf("error = %s\n", [[db lastErrorMessage] UTF8String]);
        }
        else{
            printf("Insert Ok!\n");
        }
    }
    
#pragma mark - Select from Table where year > 20
    FMResultSet *resultSet = [db executeQuery:@"select * from Login"];
    if ([resultSet next]) {
        printf("\nLogin Table:\n");
        [self printStringWith:resultSet];
    }
    else {
        printf("No data found");
    }
   //******
    NSInteger year20 = 20;
    NSDictionary *yearBiggerThan20 = @{@"year": @(year20)};
    FMResultSet *yearBiggerThan20ResultSet = [db executeQuery:@"select * from Login Where year > :year" withParameterDictionary:yearBiggerThan20];
    if ([yearBiggerThan20ResultSet next]) {
        printf("\nFilter year > 20:\n");
        [self printStringWith:yearBiggerThan20ResultSet];
    }else {
        printf("No data found");
    }
#pragma mark - Delete 1 User
    //*****
    NSInteger userID = 10;
    NSDictionary *deleteArguments = @{@"id": @(userID)};
    FMResultSet *deleteResult = [db executeQuery:@"SELECT * FROM Login WHERE id = :id"withParameterDictionary:deleteArguments];
    if ([deleteResult next]) {
        BOOL deleteSuccess = [db executeUpdate:@"DELETE FROM Login WHERE id = :id"withParameterDictionary:deleteArguments];
        if (deleteSuccess) {
            printf("\nDelete Success: ");
            [self printStringWith:deleteResult];
        }
        else{
            NSLog(@" Error: %@",[db lastErrorMessage]);
        }
    }else{
        printf(" Error: ID: %ld Not Found!",userID);
    }
    
    [db close];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void) initUserData{
    Users = @[
              [[Login alloc] initwithUsername:@"nhungoc" password:@"123123" name:@"Nhu ngoc"  year:18 address:@"Vung Tau"],
              [[Login alloc] initwithUsername:@"phuonglinh" password:@"123123" name:@"Phuong Linh"  year:19 address:@"Nam Dinh"],
              [[Login alloc] initwithUsername:@"anhhong" password:@"123123" name:@"Anh Hong"  year:21 address:@"Thai Binh"],
              [[Login alloc] initwithUsername:@"kieutrinh" password:@"123123" name:@"Kieu Trinh"  year:18 address:@"Thanh Hoa"],
              [[Login alloc] initwithUsername:@"thuyhang" password:@"123123" name:@"Thuy Hang"  year:21 address:@"Kien Giang"]
              ];
};
-(void)printStringWith:(FMResultSet *)result{
    do {
        NSInteger userId = [result intForColumn:@"id"];
        NSString *userName = [result stringForColumn:@"username"];
        NSString *password = [result stringForColumn:@"password"];
        NSString *name = [result stringForColumn:@"name"];
        NSInteger year = [result intForColumn:@"year"];
        NSString *address = [result stringForColumn:@"address"];
        printf("id: %ld username: %s password: %s name: %s year: %ld address: %s \n",userId,[userName UTF8String],[password UTF8String],[name UTF8String],year,[address UTF8String]);
    } while ([result next]);
};

@end
