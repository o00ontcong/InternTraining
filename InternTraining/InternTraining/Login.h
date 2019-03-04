//
//  Login.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/1/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *password;
@property NSInteger year;
@property (nonatomic,strong) NSString *address;
-(instancetype)initwithUsername: (NSString *)username password:(NSString *)password name:(NSString *)name  year:(NSInteger )year address:(NSString *)address;

@end
