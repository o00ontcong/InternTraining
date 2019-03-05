//
//  Phone.m
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 3/5/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "Phone.h"

@implementation Phone

-(instancetype)initWithId: (NSInteger *)Id
                     name:(NSString *)name
                     type:(NSInteger *)type
              description:(NSString *)description
                   status:(Boolean *)status
                    price:(NSInteger *)price{
    self.Id = *(Id);
    self.name = name;
    self.type = *(type);
    self.description = description;
    self.status = *(status);
    self.price = *(price);
    return self;
}
@end
