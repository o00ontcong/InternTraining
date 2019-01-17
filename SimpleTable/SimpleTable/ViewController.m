//
//  ViewController.m
//  SimpleTable
//
//  Created by Nguyen Hung Thanh Liem on 1/16/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()


//Outlet
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;

@end
@implementation ViewController
{
    NSArray *tableData;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Khởi tạo data
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
}

//UITableView - Datasource methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier =@"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;

}

//Action

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
