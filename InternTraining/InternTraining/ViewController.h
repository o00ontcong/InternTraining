//
//  ViewController.h
//  InternTraining
//
//  Created by Cong Nguyen on 16/01/2019.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import "Login.h"

@interface ViewController : UIViewController

-(void)initUserData;
-(void)printStringWith:(FMResultSet *)result;
@end

