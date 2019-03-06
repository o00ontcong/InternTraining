//
//  ShopDatabase.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/6/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#ifndef ShopDatabase_h
#define ShopDatabase_h


#endif /* ShopDatabase_h */
#import <Foundation/Foundation.h>

@interface ShopDatabase : NSObject
@property NSInteger Id;
@property (nonatomic,strong) NSString *name;
@property NSInteger type;
@property (nonatomic, strong) NSString *address;
@property Boolean status;
@property NSInteger level;

-(instancetype)initWithId: (NSInteger *)Id
                     name:(NSString *)name
                     type:(NSInteger *)type
              address:(NSString *)address
                   status:(Boolean *)status
                    level:(NSInteger *)level;

@end
