//
//  ViewController.m
//  InternTraining
//
//  Created by Cong Nguyen on 16/01/2019.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
NSArray<Login *> *Users;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUserData];
    
    
//MARK: Open Connection  --OK!
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Login.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        db = nil;
        printf("DB Open Error %s\n", [[db lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
    
    
//MARK: Delete all old Data in Table Login --OK!
 //[db executeUpdate:@"DELETE FROM Login"];
 [db executeUpdate:@"DROP TABLE LOGIN"];
    
    
//MARK: Create Table  --OK!
    BOOL createTable = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS Login (id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT NOT NULL,password TEXT NOT NULL, name TEXT, year INTEGER,address TEXT)"];
    if (!createTable) {
        printf("Create table error = %s\n", [[db lastErrorMessage] UTF8String]);
    }
    else{
        printf("Create table OK!\n");
    }
    
    
//MARK: Insert 5 user  --OK!
    
    //@Param
        for (Login *t in Users) {
        NSDictionary *arguments = @{@"username": t.username, @"password": t.password, @"name": t.name,@"year": @(t.year) ,@"address": t.address};
    //Query
        BOOL success = [db executeUpdate:@"INSERT INTO Login (username,password,name,year,address) VALUES (:username,:password,:name,:year,:address)" withParameterDictionary:arguments];
        if (!success) {
            printf("Insert error = %s\n", [[db lastErrorMessage] UTF8String]);
        }
        else{
            printf("Insert Ok!\n");
        }
    }

    
//MARK: Select from Table  --OK!
        FMResultSet *resultSet = [db executeQuery:@"select * from Login"];
        if ([resultSet next]) {
            printf("\nLogin Table:\n");
            [self printStringWith:resultSet];
        }
        else {
            printf("No data found");
        }
    
    
//MARK: Select from Table where year > 20  --OK!
    NSInteger year20 = 20;
    NSDictionary *yearBiggerThan20 = @{@"year": @(year20)};
    FMResultSet *yearBiggerThan20ResultSet = [db executeQuery:@"select * from Login Where year > :year" withParameterDictionary:yearBiggerThan20];
    if ([yearBiggerThan20ResultSet next]) {
        printf("\nFilter year > 20:\n");
        [self printStringWith:yearBiggerThan20ResultSet];
    }else {
        printf("No data found");
    }
    
//MARK: Delete 1 user
    NSInteger userID = 1;
    NSDictionary *deleteArguments = @{@"id": @(userID)};
    FMResultSet *deleteResult = [db executeQuery:@"SELECT * FROM Login WHERE id = :id"withParameterDictionary:deleteArguments];
    if ([deleteResult next]) {
        BOOL deleteSuccess = [db executeUpdate:@"DELETE FROM Login WHERE id = :id"withParameterDictionary:deleteArguments];
        if (deleteSuccess) {
            printf("\nDelete Success Record: \n");
            [self printStringWith:deleteResult];
        }
        else{
            NSLog(@"Delete Error: %@",[db lastErrorMessage]);
        }
    }else{
        printf("Delete Error: ID: %ld Not Found!",userID);
    }
    
    
    
//MARK: Close Connection  --OK!
    [db close];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(void) initUserData{
    Users = @[
        [[Login alloc] initwithUsername:@"liem10" password:@"pass" name:@"Liem Nguyen" address:@"Trang Bom" year:10],
        [[Login alloc] initwithUsername:@"liem21" password:@"pass21" name:@"Liem Nguyen" address:@"Trang Bom" year:21],
        [[Login alloc] initwithUsername:@"liem32" password:@"pass32" name:@"Liem Nguyen" address:@"Trang Bom" year:32],
         [[Login alloc] initwithUsername:@"liem43" password:@"pass43" name:@"Liem Nguyen" address:@"Trang Bom" year:43],
          [[Login alloc] initwithUsername:@"liem54" password:@"pass54" name:@"Liem Nguyen" address:@"Trang Bom" year:54]
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
