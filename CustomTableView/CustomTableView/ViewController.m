//
//  ViewController.m
//  CustomTableView
//
//  Created by Nguyen Hung Thanh Liem on 1/16/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;

@end

@implementation ViewController
{
    NSArray *tableData;
    NSArray *tableImage;
    NSArray *tableTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    tableImage = [NSArray arrayWithObjects:@"gradient_bilinear.jpg",@"gradient_fx_spherical.gif",@"images.jpeg",@"size100.jpg",@"gradient_bilinear.jpg",@"gradient_fx_spherical.gif",@"images.jpeg",@"size100.jpg",@"gradient_bilinear.jpg",@"gradient_fx_spherical.gif",@"images.jpeg",@"size100.jpg",@"gradient_bilinear.jpg",@"gradient_fx_spherical.gif",@"images.jpeg",@"size100.jpg", nil];
    tableTime = [NSArray arrayWithObjects:@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time",@"time", nil];

}
//Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[tableImage objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [tableTime objectAtIndex:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
