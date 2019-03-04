//
//  Login.m
//  InternTraining∫
//
//  Created by Nguyen Hung Thanh Liem on 3/1/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "Login.h"

@implementation Login

-(instancetype)initwithUsername: (NSString *)username password: (NSString *)password name: (NSString *)name address: (NSString *)address year: (NSInteger )year{
    self.username = username;
    self.password = password;
    self.name = name;
    self.year = year;
    self.address = address;
    return self;
}

@end
