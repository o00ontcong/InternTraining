//
//  Phone.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/5/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject
@property NSInteger Id;
@property (nonatomic,strong) NSString *name;
@property NSInteger type;
@property (nonatomic, strong) NSString *description;
@property Boolean status;
@property NSInteger price;

-(instancetype)initWithId: (NSInteger *)Id
                     name:(NSString *)name
                     type:(NSInteger *)type
              description:(NSString *)description status:(Boolean *)status
                    price:(NSInteger *)price;

@end
