//
//  ContactAreaViewController.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import "ProvinceTableViewCell.h"

@interface ContactAreaViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *provinceDropdownView;
@property (weak, nonatomic) IBOutlet UITextField *provinceDropdownTextFlied;
@property (weak, nonatomic) IBOutlet UIButton *provinceDropdownButton;
- (IBAction)didPressDropdownButton:(id)sender;
- (IBAction)didTouchInsideProvinceTextField:(id)sender;
- (IBAction)editingDidBegin:(UITextField *)sender;
- (IBAction)editingChanged:(UITextField *)sender;
- (IBAction)touchDownRepeat:(UITextField *)sender;
- (IBAction)touchUpOutSide:(UITextField *)sender;
- (IBAction)primaryActionTriggered:(UITextField *)sender;

@end
