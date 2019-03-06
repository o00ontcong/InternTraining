//
//  ShopViewController.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/6/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation ShopViewController
- (IBAction)showSearchBar:(id)sender {
    if (_searchBar.hidden) {
        _searchBar.hidden = false;
    } else {
        _searchBar.hidden = true;
    }
}
    

- (IBAction)CloseBtn:(id)sender {
     [self dismissViewControllerAnimated:NO completion:nil];
}

NSString *pathShop;
NSMutableArray *shops;
NSString *databaseName = @"ShopDemo.db";
FMDatabase *shopdb;
NSString *tableQueue= @"CREATE TABLE IF NOT EXISTS shopDemo (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,type INTEGER,address TEXT, status BOOLEAN ,level INTEGER)";

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
    shops = nil;
    [self createTable];
    
    //MARK: Get tabledata
    if(!shops) shops = [[NSMutableArray alloc] init];
    [self getAllFromShop];
    
    //Query
    [self queryStatus1];
    [self queryLevel2];
    [self queryHCM_Type2_Status1];
    [self.tableView reloadData];
    
}


#pragma mark - TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return shops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"ShopTableViewCell";
    ShopDatabase *indexShop = [shops objectAtIndex:indexPath.row];
    ShopTableViewCell *cell = (ShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ShopTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.imageShop.image = [UIImage imageNamed:@"shop.png"];
    cell.nameShop.text = indexShop.name;
    
    cell.typeShop.text = [NSString stringWithFormat:@"Type: %ld",indexShop.type];
    cell.addressShop.text =  indexShop.address;
    cell.statusShop.text = indexShop.status == 1?@"Available":@"N/A";
    cell.levelShop.text =  [NSString stringWithFormat:@"Level: %ld",indexShop.level];
    
    return cell;
}
    
#pragma mark - Query
-(void)openConnection{
    pathShop = [NSTemporaryDirectory() stringByAppendingPathComponent:databaseName];
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
    BOOL createTableresult = [shopdb executeUpdate:tableQueue];
    if (!createTableresult) {
        printf("Create table error = %s\n", [[shopdb lastErrorMessage] UTF8String]);
    }
    else{
        printf("Create table OK!\n");
    }
}
-(void)queryLevel2{
    NSString *query2 = @"select id,name,type,address,status,level from shopDemo where level > 2";
    FMResultSet *twentyMilionResultSet = [shopdb executeQuery:query2];
    
    if ([twentyMilionResultSet next]) {
        do {
            NSLog(@" 2 ResultSet  %@",[twentyMilionResultSet resultDictionary]);
        } while ([twentyMilionResultSet next]);
    }
    else {
        printf("No Level > 2 found\n");
    }
};
-(void)queryStatus1{
    NSString *querystatus1 =@"select id,name,type,address,status,level from shopDemo WHERE status = 1";
    FMResultSet *status1ResultSet = [shopdb executeQuery:querystatus1];
    if ([status1ResultSet next]) {
        do {
            NSLog(@"Status 1 ResultSet  %@",[status1ResultSet resultDictionary]);
        } while ([status1ResultSet next]);
    }
    else {
        printf("No Status 1 found\n");
    }
};
-(void)queryHCM_Type2_Status1{
    NSString *query20 = @"select id,name,type,address,status,level from shopDemo Where (status = 1 AND type = 2 AND address LIKE 'HCM')";
    FMResultSet *decriptionHCMResultSet = [shopdb executeQuery:query20];
    if ([decriptionHCMResultSet next]) {
        do {
            NSLog(@"HCM ResultSet %@",[decriptionHCMResultSet resultDictionary]);
        } while ([decriptionHCMResultSet next]);
    }
    else {
        printf("No HCM found\n");
    }
};
#pragma mark - getResultSetValue
-(ShopDatabase *)getResultSetValueWith:(FMResultSet *)result{
    NSInteger shopId = [result intForColumn:@"id"];
    NSString *name = [result stringForColumn:@"name"];
    NSInteger type = [result intForColumn:@"type"];
    NSString *address = [result stringForColumn:@"address"];
    Boolean status = [result boolForColumn:@"status"];
    NSInteger level = [result intForColumn:@"level"];
    
    return [[ShopDatabase alloc] initWithId:&shopId name:name type:&type address:address status:&status level:&level];
};

-(void)getAllFromShop{
    if(!shops) shops = [[NSMutableArray alloc] init];
    NSString *query =@"select * from shopDemo ";
    FMResultSet *resultSet = [shopdb executeQuery:query];
    if ([resultSet next]) {
        do {
            [shops addObject: [self getResultSetValueWith:resultSet]];
        } while ([resultSet next]);
    }
    else {
        printf("No Data found\n");
    }
};

@end
