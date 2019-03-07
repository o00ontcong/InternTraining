//
//  ShopDatabase.h
//  InternTraining
//
//  Created by Pham Anh Tuan on 3/7/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#ifndef ShopDatabase_h
#define ShopDatabase_h


#endif /* ShopDatabase_h */

#import <Foundation/Foundation.h>

@interface ShopDatabase : NSObject
@property NSInteger Id;
@property (nonatomic,strong) NSString *name;
@property NSInteger price;
@property (nonatomic, strong) NSString *cpu;
@property (nonatomic, strong) NSString *hdh;
@property (nonatomic, strong) NSString *hdd;


-(instancetype)initWithId: (NSInteger *)Id
                     name:(NSString *)name
                     price:(NSInteger *)price
                  cpu:(NSString *)cpu
                    hdh:(NSString *)hdh
                      hdd:(NSString *)hdd;

@end
