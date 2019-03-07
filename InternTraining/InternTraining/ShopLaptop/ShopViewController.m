//
//  ShopViewController.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//


#import "ShopViewController.h"

@interface ShopViewController ()




@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchView;


@end

@implementation ShopViewController




NSString *pathLaptop;
NSMutableArray *laptops;
NSString *databaseShop = @"Laptop.db";
FMDatabase *laptopdb;
NSString *tableQueueShop= @"CREATE TABLE IF NOT EXISTS laptop_list (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,price INTEGER, cpu TEXT,ram INTEGER,hdh BOOLEAN,hdd INTEGER)";
- (IBAction)exitView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)showSearchBar:(id)sender {
   
        if (_searchView.hidden) {
            _searchView.hidden = false;
        } else {
            _searchView.hidden = true;
        }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    
}//End vỉewDidLoad





-(void)viewWillAppear:(BOOL)animated{
    
    //MARK: Open Connection;
    [self openConnection];
    
    //MARK: Create Table
    laptops = nil;
    [self createTable];
    //MARK: Get tabledata
    if(!laptops) laptops = [[NSMutableArray alloc] init];
    [self getAllFromShop];
    
    //Query
    [self queryPriceOver10m];
    [self queryRamOver2gb_CPUCoreI5];
    [self queryHDH_HDDOver500gb_PriceOver10m];
    [self.tableView reloadData];
    
}
#pragma mark - TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return laptops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
    
    static NSString *simpleTableIdentifier = @"ShopTableViewCell";
    Laptop *indexShop = [laptops objectAtIndex:indexPath.row];
    ShopTableViewCell *cell = (ShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ShopTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.imageLaptop.image = [UIImage imageNamed:@"s.jpg"];
    cell.nameLatop.text = indexShop.name;
    
    cell.priceLaptop.text = [NSString stringWithFormat:@"Price: %ld",indexShop.price];
    cell.cpuLaptop.text =  indexShop.cpu;
    cell.ramLaptop.text = [NSString stringWithFormat:@"Ram: %ld",indexShop.ram];
    cell.hdhLaptop.text = indexShop.hdh == 1?@"Windows":@"MacOS";
    cell.hddLaptop.text =  [NSString stringWithFormat:@"Hdd: %ld",indexShop.hdd];
    
    return cell;
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
    NSString *query10m = @"select id,name,price,cpu,ram,hdh,hdd from laptop_list where price > 10000000";
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
    NSString *queryRC =@"select id,name,price,cpu,ram,hdh,hdd from laptop_list where (ram > 2 AND cpu LIKE 'i5')";
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
    NSString *queryPrice10m = @"select id,name,price,cpu,ram,hdh,hdd from laptop_list where (hdh = 0 AND hdd > 500 AND price > 10000000)";
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
-(Laptop *)getResultSetValueWith:(FMResultSet *)result{
    NSInteger laptopId = [result intForColumn:@"id"];
    NSString *name = [result stringForColumn:@"name"];
    NSInteger price = [result intForColumn:@"price"];
    NSString *cpu = [result stringForColumn:@"cpu"];
    NSInteger ram = [result intForColumn:@"ram"];
    Boolean hdh = [result boolForColumn:@"hdh"];
    NSInteger hdd = [result intForColumn:@"hdd"];
    return [[Laptop alloc] initWithId:&laptopId name:name price:&price cpu:cpu ram:&ram hdh:&hdh hdd:&hdd];
};

-(void)getAllFromShop{
    if(!laptops) laptops = [[NSMutableArray alloc] init];
    NSString *query =@"select * from laptop_list";
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
