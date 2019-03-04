//
//  Login.m
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/1/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "Login.h"

@implementation Login

-(instancetype)initwithUsername: (NSString *)username password: (NSString *)password name: (NSString *)name  year: (NSInteger )year address: (NSString *)address {
    self.username = username;
    self.password = password;
    self.name = name;
    self.year = year;
    self.address = address;
    return self;
}

@end
