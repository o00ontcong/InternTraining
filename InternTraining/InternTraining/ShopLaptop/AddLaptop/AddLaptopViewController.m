//
//  AddLaptopViewController.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "AddLaptopViewController.h"

@interface AddLaptopViewController ()

@end

@implementation AddLaptopViewController

FMDatabase *databaseLaptop;
@synthesize nameAddLaptop;
@synthesize priceAddLaptop;
@synthesize cpuAddLaptop;
@synthesize ramAddLaptop;
@synthesize hdhAddLaptop;
@synthesize hddAddLaptop;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [self.priceAddLaptop setKeyboardType:UIKeyboardTypeNumberPad];
    [self.ramAddLaptop setKeyboardType:UIKeyboardTypeNumberPad];
    [self.hddAddLaptop setKeyboardType:UIKeyboardTypeNumberPad];
    UIImageView *imgViewForDropDown = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    imgViewForDropDown.image = [UIImage imageNamed:@"dropdown-1.jpg"];
    ramAddLaptop.rightView = imgViewForDropDown;
    ramAddLaptop.rightViewMode = UITextFieldViewModeAlways;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (IBAction)didPressAddButton:(id)sender {
    NSString *emptyString = @"";
    NSString *name = nameAddLaptop.text;
    NSInteger price =[priceAddLaptop.text intValue];
    NSString *cpu = cpuAddLaptop.text;
    NSInteger ram = [ramAddLaptop.text intValue];
    Boolean hdh;
    NSInteger hdd = [hddAddLaptop.text intValue];
    if (hdhAddLaptop.selectedSegmentIndex == 0) {
        hdh = 1;
    }else{
        hdh = 0;
    }
    
    [self openConnection];
    //Check Empty
    if ([name isEqualToString: emptyString] || price == 0 || [cpu isEqualToString: emptyString] || ram <= 0 || hdd == 0 ) {
        NSLog(@"Error: no Empty");
    }
    else{
        //Insert
        NSString *insertString = [NSString stringWithFormat:@"INSERT INTO TBStore (name,price,cpu,ram,hdh,hdd) VALUES ('%@',%ld,'%@',%ld,%d,%ld)",name,price,cpu,ram,hdh,hdd];
        BOOL success = [databaseLaptop executeStatements:insertString];
        if (!success) {
            printf("Insert error = %s\n", [[databaseLaptop lastErrorMessage] UTF8String]);
        }
        else{
            printf("Insert Ok!\n");
        }
        [self queryAllRecord];
        
    }
}
#pragma mark - Query
-(void)openConnection{
    NSString *pathl = [NSTemporaryDirectory() stringByAppendingPathComponent:@"StoreLaptop.db"];
    databaseLaptop = [FMDatabase databaseWithPath:pathl];
    if (![databaseLaptop open]) {
        databaseLaptop = nil;
        printf("DB Open Error %s\n", [[databaseLaptop lastErrorMessage] UTF8String]);
    }
    else {
        printf("DB Open OK!\n");
    }
};

-(void)queryAllRecord{
    
    FMResultSet *resultSet = [databaseLaptop executeQuery:@"select * from TBStore"];
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
