//
//  SimpleTableCell.h
//  CustomTableView
//
//  Created by Nguyen Hung Thanh Liem on 1/16/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;


@end
