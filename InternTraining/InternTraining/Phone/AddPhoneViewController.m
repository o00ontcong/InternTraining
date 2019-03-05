//
//  AddPhoneViewController.m
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/5/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "AddPhoneViewController.h"

@interface AddPhoneViewController ()

@end

@implementation AddPhoneViewController

FMDatabase *database;
@synthesize phoneTextField;
@synthesize typeTextField;
@synthesize descriptionTextField;
@synthesize priceTextField;
@synthesize statusSegmented;

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)viewWillAppear:(BOOL)animated{
    [self.typeTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.priceTextField setKeyboardType:UIKeyboardTypeNumberPad];
}

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
    [self dismissViewControllerAnimated:YES completion:nil];
}
//MARK: #TLTR: Check Empty and insert to Phone_master
- (IBAction)didPressAddButton:(id)sender {
    NSString *emptyString = @"";
    NSString *phone = phoneTextField.text;
    NSInteger type =[typeTextField.text intValue];
    Boolean status;
    NSString *description = descriptionTextField.text;
    NSInteger price = [priceTextField.text intValue];
    if (statusSegmented.selectedSegmentIndex == 0) {
        status = 1;
    }else{
        status = 0;
    }
    
    [self openConnection];
    //Check Empty
    if ([phone isEqualToString: emptyString] || type == 0 || [description isEqualToString: emptyString] || price > 0) {
        NSLog(@"Error: One of Input Field is empty or smaller than 0");
    }
    else{
        //Insert
        NSString *insertString = [NSString stringWithFormat:@"INSERT INTO phone_master (name,type,description,status,price) VALUES ('%@',%ld,'%@',%d,%ld)",phone,type,description,status,price];
        BOOL success = [database executeStatements:insertString];
        if (!success) {
            printf("Insert error = %s\n", [[database lastErrorMessage] UTF8String]);
        }
        else{
            printf("Insert Ok!\n");
        }
        //Query all Record
        FMResultSet *resultSet = [database executeQuery:@"select * from phone_master"];
        if ([resultSet next]) {
            do {
                NSLog(@"%@",[resultSet resultDictionary]);
            } while ([resultSet next]);
        }
        else {
            printf("No data found");
        }
    }
}
-(void)openConnection{
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Phone.db"];
    database = [FMDatabase databaseWithPath:path];
    if (![database open]) {
        database = nil;
        printf("DB Open Error %s\n", [[database lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
};@end
