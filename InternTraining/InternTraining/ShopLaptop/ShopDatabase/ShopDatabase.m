//
//  ShopDatabase.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ShopDatabase.h"

@implementation ShopDatabase
@synthesize description;
//*
-(instancetype)initWithId: (NSInteger *)Id
                     name:(NSString *)name
                    price:(NSInteger *)price
                      cpu:(NSString *)cpu
                    ram:(NSInteger *)ram
                      hdh:(Boolean *)hdh
                      hdd:(NSInteger *)hdd{
    self.Id = *(Id);
    self.name = name;
    self.price = *(price);
    self.cpu = cpu;
    self.ram = *(ram);
    self.hdh = *(hdh);
    self.hdd = *(hdd);
    return self;

}
@end
