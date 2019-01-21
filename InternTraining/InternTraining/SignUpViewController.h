//
//  SignUpViewController.h
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 1/18/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
- (IBAction)closeCurrentView:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;




@end
