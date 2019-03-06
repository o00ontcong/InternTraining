//
//  AddShopViewController.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/6/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "AddShopViewController.h"

@interface AddShopViewController ()

@end

@implementation AddShopViewController

FMDatabase *databaseShop;
@synthesize nameAddShop;
@synthesize typeAddShop;
@synthesize addressAddShop;
@synthesize statusAddShop;
@synthesize levelAddShop;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [self.typeAddShop setKeyboardType:UIKeyboardTypeNumberPad];
    [self.levelAddShop setKeyboardType:UIKeyboardTypeNumberPad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (IBAction)didPressAddButton:(id)sender {
    NSString *emptyString = @"";
    NSString *name = nameAddShop.text;
    NSInteger type =[typeAddShop.text intValue];
   
    NSString *address = addressAddShop.text;
     Boolean status;
    NSInteger level = [levelAddShop.text intValue];
    if (statusAddShop.selectedSegmentIndex == 0) {
        status = 1;
    }else{
        status = 0;
    }
    
    [self openConnection];
    //Check Empty
    if ([name isEqualToString: emptyString] || type == 0 || [address isEqualToString: emptyString] || level <= 0) {
        NSLog(@"Error: Some Input Field is empty or smaller than 0");
    }
    else{
        //Insert
        NSString *insertString = [NSString stringWithFormat:@"INSERT INTO shopDemo (name,type,address,status,level) VALUES ('%@',%ld,'%@',%d,%ld)",name,type,address,status,level];
        BOOL success = [databaseShop executeStatements:insertString];
        if (!success) {
            printf("Insert error = %s\n", [[databaseShop lastErrorMessage] UTF8String]);
        }
        else{
            printf("Insert Ok!\n");
        }
        [self queryAllRecord];
        
    }
}
#pragma mark - Query
-(void)openConnection{
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"ShopDemo.db"];
    databaseShop = [FMDatabase databaseWithPath:path];
    if (![databaseShop open]) {
        databaseShop = nil;
        printf("DB Open Error %s\n", [[databaseShop lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
};

-(void)queryAllRecord{
   
    FMResultSet *resultSet = [databaseShop executeQuery:@"select * from shopDemo"];
    if ([resultSet next]) {
        do {
            NSLog(@"%@",[resultSet resultDictionary]);
        } while ([resultSet next]);
    }
    else {
        printf("No data found");
    }
};

@end
