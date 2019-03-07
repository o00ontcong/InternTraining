//
//  Laptop.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//


#import <Foundation/Foundation.h>
//*
@interface Laptop : NSObject
@property NSInteger Id;
@property (nonatomic,strong) NSString *name;
@property NSInteger price;
@property (nonatomic, strong) NSString *cpu;
@property NSInteger ram;
@property Boolean hdh;
@property NSInteger hdd;


-(instancetype)initWithId: (NSInteger *)Id
                     name:(NSString *)name
                     price:(NSInteger *)price
                  cpu:(NSString *)cpu
                    ram:(NSInteger *)ram
                    hdh:(Boolean *)hdh
                      hdd:(NSInteger *)hdd;

@end
