//
//  Login.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/1/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *address;
@property NSInteger year;

-(instancetype)initwithUsername: (NSString *)username password:(NSString *)password name:(NSString *)name address:(NSString *)address year:(NSInteger )year;

@end
