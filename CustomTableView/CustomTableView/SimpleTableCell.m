//
//  SimpleTableCell.m
//  CustomTableView
//
//  Created by Nguyen Hung Thanh Liem on 1/16/19.
//  Copyright © 2019 Nguyen Hung Thanh Liem. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell

@synthesize nameLabel = _nameLabel;
@synthesize prepTimeLabel = _prepTimeLabel;
@synthesize thumbnailImageView = _thumbnailImageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
