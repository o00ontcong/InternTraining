//
//  ContactAreaViewController.m
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "ContactAreaViewController.h"

@interface ContactAreaViewController ()

@end

@implementation ContactAreaViewController
//Too lazy to Create Object
    NSMutableArray *ProvinceArea_ID;
    NSMutableArray *Province_Name;
    NSMutableArray *DistrictArea_ID;
    NSMutableArray *District_Name;
    NSMutableArray *PrecinctArea_ID;
    NSMutableArray *Precinct_Name;

- (void)viewDidLoad {
    [super viewDidLoad];
    if(!ProvinceArea_ID) ProvinceArea_ID = [[NSMutableArray alloc]init];
    if(!Province_Name) Province_Name = [[NSMutableArray alloc]init];
    if(!DistrictArea_ID) DistrictArea_ID = [[NSMutableArray alloc]init];
    if(!District_Name) District_Name = [[NSMutableArray alloc]init];
    if(!PrecinctArea_ID) PrecinctArea_ID = [[NSMutableArray alloc]init];
    if(!Precinct_Name) Precinct_Name = [[NSMutableArray alloc]init];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (void)viewWillAppear:(BOOL)animated{
    self.tableView.hidden = YES;
    [self getAreaProvinceCount];
    [self getAreaProvinceList];
    NSInteger provinceID = [[ProvinceArea_ID objectAtIndex:0]integerValue];
    [self getDistrictListWithProvinceAREA_ID:provinceID];
    NSInteger districtId = [[DistrictArea_ID objectAtIndex:0]integerValue];
    [self getPrecinctListWithDistrictAREA_ID:districtId];
    
    
    [self getDistrictWithBiggestAreaCodeOfProvince];
    [self getProcductPriceWithShopid];
}

//MARK:Table DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ProvinceArea_ID.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProvinceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"provincecell"];
    cell.AreaNameLabel.text = [Province_Name objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tableView.hidden = YES;
    self.provinceDropdownTextFlied.text = [Province_Name objectAtIndex:indexPath.row];
    NSInteger precincta_ID = [[Province_Name objectAtIndex:indexPath.row]integerValue];
    NSLog(@"%ld", precincta_ID);
    [self getDistrictListWithProvinceAREA_ID:precincta_ID];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//MARK: Query Data
//Reference: https://stackoverflow.com/questions/17080018/use-and-access-existing-sqlite-database-on-ios
    - (void)getAreaProvinceCount {
        // Getting the database path.
        NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsPath = [paths objectAtIndex:0];
        NSString *dbPath = [docsPath stringByAppendingPathComponent:@"1051_2880_DMSCoreDatabase.sqlite"];
        FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
        [database open];

        NSString *sqlSelectQuery = @"SELECT Count(PROVINCE) as count "
                                    "FROM AREA "
                                    "where PARENT_AREA_ID = 2";
        
        // Query result
        FMResultSet *result = [database executeQuery:sqlSelectQuery];
        if (![result next]) {
            NSLog(@"Error: No data Found");
        }
        else{
                //Log query result
                NSString *count = [NSString stringWithFormat:@"%d",[result intForColumn:@"count"]];
                NSLog(@"count = %@",count);
            }
        [database close];
    }
-(void)getAreaProvinceList{
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *dbPath = [docsPath stringByAppendingPathComponent:@"1051_2880_DMSCoreDatabase.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    
    //Query result
    NSString *sqlSelectQuery = @"SELECT PROVINCE_NAME,AREA_ID "
                                "FROM AREA "
                                "where PARENT_AREA_ID = 2 ";
     FMResultSet *result = [database executeQuery:sqlSelectQuery];
    if (![result next]) {
        NSLog(@"Error: No data Found");
    }
    else{
        NSInteger index = 0;
        do{
            [ProvinceArea_ID addObject: @([result intForColumn:@"AREA_ID"])];
            [Province_Name addObject:[result stringForColumn:@"PROVINCE_NAME"]];
            //Log query result
            NSLog(@"Area_ID = %@, PROVINCE_NAME = %@",[ProvinceArea_ID objectAtIndex:index],[Province_Name objectAtIndex:index]);
            index +=1;
        }while ([result next]);
    }
    [database close];
}
-(void)getDistrictListWithProvinceAREA_ID:(NSInteger)provinceAREA_ID {
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *dbPath = [docsPath stringByAppendingPathComponent:@"1051_2880_DMSCoreDatabase.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    
    //Query result
    NSString *sqlSelectQuery = [NSString stringWithFormat:@"SELECT AREA_ID,DISTRICT_NAME "
                                                            "FROM AREA "
                                                            "where PARENT_AREA_ID = %ld",provinceAREA_ID];
    
    FMResultSet *result = [database executeQuery:sqlSelectQuery];
    if (![result next]) {
        NSLog(@"Error: No data Found");
    }
    else{
        NSInteger index = 0;
        do{
            [DistrictArea_ID addObject: @([result intForColumn:@"AREA_ID"])];
            [District_Name addObject:[result stringForColumn:@"DISTRICT_NAME"]];
            //Log query result
            NSLog(@"Area_ID = %@, DISTRICT_NAME = %@",[DistrictArea_ID objectAtIndex:index],[District_Name objectAtIndex:index]);
            index +=1;
        }while ([result next]);
    }
    [database close];
}
-(void)getPrecinctListWithDistrictAREA_ID:(NSInteger)DistrictAREA_ID {
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *dbPath = [docsPath stringByAppendingPathComponent:@"1051_2880_DMSCoreDatabase.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    
    //Query result
    NSString *sqlSelectQuery = [NSString stringWithFormat:@"SELECT AREA_ID,PRECINCT_NAME FROM AREA where PARENT_AREA_ID = %ld",DistrictAREA_ID];
    
    FMResultSet *result = [database executeQuery:sqlSelectQuery];
    if (![result next]) {
        NSLog(@"Error: No data Found");
    }
    else{
        NSInteger index = 0;
        do{
            [PrecinctArea_ID addObject: @([result intForColumn:@"AREA_ID"])];
            [Precinct_Name addObject:[result stringForColumn:@"PRECINCT_NAME"]];
            //Log query result
            NSLog(@"Area_ID = %@, PRECINCT_NAME = %@",[PrecinctArea_ID objectAtIndex:index],[Precinct_Name objectAtIndex:index]);
            index +=1;
        }while ([result next]);
    }
    [database close];
}

//MARK: Query Area

-(void)getDistrictWithBiggestAreaCodeOfProvince{
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *dbPath = [docsPath stringByAppendingPathComponent:@"1051_2880_DMSCoreDatabase.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    
    //Query result
    NSString *sqlSelectQuery = [NSString stringWithFormat:@"SELECT PARENT_AREA_ID, AREA_ID, PROVINCE_NAME, "
                                "DISTRICT_NAME, Max(AREA_CODE) as AREA_CODE "
                                "from AREA WHERE PROVINCE in "
                                "(SELECT PROVINCE FROM AREA where PARENT_AREA_ID = 2) "
                                "and PRECINCT_NAME is NULL "
                                "and DISTRICT_NAME is not NULL "
                                "GROUP by PROVINCE_NAME "
                                "ORDER by PARENT_AREA_ID"];
    
    FMResultSet *result = [database executeQuery:sqlSelectQuery];
    if (![result next]) {
        NSLog(@"Error: No data Found");
    }
    else{
        do{
            NSString *PARENT_AREA_ID = [NSString  stringWithFormat:@"%d",[result intForColumn:@"PARENT_AREA_ID"]];
            NSString *PROVINCE_NAME = [result stringForColumn:@"PROVINCE_NAME"];
            NSString *DISTRICT_NAME = [result stringForColumn:@"DISTRICT_NAME"];
            NSString *AREA_ID = [NSString  stringWithFormat:@"%d",[result intForColumn:@"AREA_ID"]];
            NSString *AREA_CODE = [result stringForColumn:@"AREA_CODE"];
            //Log query result
            NSLog(@"ParentAreaId = %@, ProvinceName = %@, DistrictName = %@, AreaID = %@, AreaCode = %@"
                  ,PARENT_AREA_ID,PROVINCE_NAME,DISTRICT_NAME,AREA_ID,AREA_CODE);
        }while ([result next]);
    }
    [database close];
}


//MARK: Query Shop-Product-Price
-(void)getProcductPriceWithShopid{
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *dbPath = [docsPath stringByAppendingPathComponent:@"1051_2880_DMSCoreDatabase.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    
    //Query result
    NSString *sqlSelectQuery = [NSString stringWithFormat:@"SELECT PARENT_AREA_ID, AREA_ID, PROVINCE_NAME, "
                                "DISTRICT_NAME, Max(AREA_CODE) as AREA_CODE "
                                "from AREA WHERE PROVINCE in "
                                "(SELECT PROVINCE FROM AREA where PARENT_AREA_ID = 2) "
                                "and PRECINCT_NAME is NULL "
                                "and DISTRICT_NAME is not NULL "
                                "GROUP by PROVINCE_NAME "
                                "ORDER by PARENT_AREA_ID"];
    
    FMResultSet *result = [database executeQuery:sqlSelectQuery];
    if (![result next]) {
        NSLog(@"Error: No data Found");
    }
    else{
        NSLog(@"ProcductPrice: %@",[result resultDictionary]);
        
//        do{
//            NSString *PARENT_AREA_ID = [NSString  stringWithFormat:@"%d",[result intForColumn:@"PARENT_AREA_ID"]];
//            NSString *PROVINCE_NAME = [result stringForColumn:@"PROVINCE_NAME"];
//            NSString *DISTRICT_NAME = [result stringForColumn:@"DISTRICT_NAME"];
//            NSString *AREA_ID = [NSString  stringWithFormat:@"%d",[result intForColumn:@"AREA_ID"]];
//            NSString *AREA_CODE = [result stringForColumn:@"AREA_CODE"];
//            //Log query result
//            NSLog(@"ParentAreaId = %@, ProvinceName = %@, DistrictName = %@, AreaID = %@, AreaCode = %@"
//                  ,PARENT_AREA_ID,PROVINCE_NAME,DISTRICT_NAME,AREA_ID,AREA_CODE);
//        }while ([result next]);
    }
    [database close];
}


//MARK: Dropdown Touch action
- (IBAction)didPressDropdownButton:(id)sender {
    if (self.tableView.hidden) {
        self.tableView.hidden = NO;
    }else{
         self.tableView.hidden = YES;
    }
    
}

- (IBAction)didTouchInsideProvinceTextField:(id)sender {
    if (self.tableView.hidden) {
        self.tableView.hidden = NO;
    }else{
        self.tableView.hidden = YES;
    }
}

- (IBAction)editingDidBegin:(UITextField *)sender {
    self.tableView.hidden = NO;
}

- (IBAction)editingChanged:(UITextField *)sender {
     self.tableView.hidden = NO;
}

- (IBAction)touchDownRepeat:(UITextField *)sender {
     self.tableView.hidden = NO;
}

- (IBAction)touchUpOutSide:(UITextField *)sender {
     self.tableView.hidden = YES;
}

- (IBAction)primaryActionTriggered:(UITextField *)sender {
     self.tableView.hidden = YES;
}
@end
