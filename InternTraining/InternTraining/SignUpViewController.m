//
//  SignUpViewController.m
//  InternTraining
//
//  Created by Nguyen Hung Thanh Liem on 1/18/19.
//  Copyright © 2019 Cong Nguyen. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()



@end

@implementation SignUpViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBottomLineToUITextField];
   
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//Add Buttom line to UITextField
- (void) addBottomLineToUITextField{
    [self addLineToView:self.fullNameTextField atPosition:LINE_POSITION_BOTTOM withColor:[UIColor colorWithRed:0.42 green:0.33 blue:0.76 alpha:1.0] lineWitdh:1];
    [self addLineToView:self.emailTextField atPosition:LINE_POSITION_BOTTOM withColor:[UIColor colorWithRed:0.42 green:0.33 blue:0.76 alpha:1.0] lineWitdh:1];
    [self addLineToView:self.passwordTextField atPosition:LINE_POSITION_BOTTOM withColor:[UIColor colorWithRed:0.42 green:0.33 blue:0.76 alpha:1.0] lineWitdh:1];
    [self addLineToView:self.confirmPasswordTextField atPosition:LINE_POSITION_BOTTOM withColor:[UIColor colorWithRed:0.42 green:0.33 blue:0.76 alpha:1.0] lineWitdh:1];
}


//UITextField must contain an auto layout to use this method
typedef enum : NSUInteger {
    LINE_POSITION_TOP,
    LINE_POSITION_BOTTOM
} LINE_POSITION;

- (void) addLineToView:(UIView *)view atPosition:(LINE_POSITION)position withColor:(UIColor *)color lineWitdh:(CGFloat)width {
    // Add line
    UIView *lineView = [[UIView alloc] init];
    [lineView setBackgroundColor:color];
    [lineView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view addSubview:lineView];
    
    NSDictionary *metrics = @{@"width" : [NSNumber numberWithFloat:width]};
    NSDictionary *views = @{@"lineView" : lineView};
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[lineView]|" options: 0 metrics:metrics views:views]];
    
    switch (position) {
        case LINE_POSITION_TOP:
            [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lineView(width)]" options: 0 metrics:metrics views:views]];
            break;
            
        case LINE_POSITION_BOTTOM:
            [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineView(width)]|" options: 0 metrics:metrics views:views]];
            break;
        default: break;
    }
}


- (IBAction)closeCurrentView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
