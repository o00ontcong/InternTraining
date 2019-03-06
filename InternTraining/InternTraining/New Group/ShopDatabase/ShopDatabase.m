//
//  ShopDatabase.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/6/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShopDatabase.h"

@implementation ShopDatabase
@synthesize description;

-(instancetype)initWithId: (NSInteger *)Id
                     name:(NSString *)name
                     type:(NSInteger *)type
              address:(NSString *)address
                   status:(Boolean *)status
                    level:(NSInteger *)level{
    self.Id = *(Id);
    self.name = name;
    self.type = *(type);
    self.address = address;
    self.status = *(status);
    self.level = *(level);
    return self;
}
@end
