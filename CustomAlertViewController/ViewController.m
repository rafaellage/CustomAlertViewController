//
//  ViewController.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 21/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertViewController.h"
#import "CustomAlertAction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Usage Examples
- (void)customAlertWithDefaultAction {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TESTE!" message:@"Message Message Message! YEY"];
    [customAlert showInViewController:self];
}

- (void)customAlertWithTwoActions {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TESTE!" message:@"Message Message Message! Message Message Message! Message Message Message! Message Message Message! Message Message Message! Message Message Message! YEY"];
    
    CustomAlertAction *action1 = [CustomAlertAction actionWithTitle:@"action1" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 1 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action1];
    
    CustomAlertAction *action2 = [CustomAlertAction actionWithTitle:@"action2" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 2 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action2];
    
    [customAlert showInViewController:self];
}

- (void)customAlertWithThreeOrMoreActions {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TESTE!" message:@"Message Message Message! YEY"];
    
    CustomAlertAction *action1 = [CustomAlertAction actionWithTitle:@"action1" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 1 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action1];
    
    CustomAlertAction *action2 = [CustomAlertAction actionWithTitle:@"action2" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 2 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action2];
    CustomAlertAction *action3 = [CustomAlertAction actionWithTitle:@"action3" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 3 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action3];
    
    [customAlert showInViewController:self];
}

#pragma mark - Button Actions
- (IBAction)oneActionTouchUpInside:(id)sender {
    [self customAlertWithDefaultAction];
}

- (IBAction)twoActionsTouchUpInside:(id)sender {
    [self customAlertWithTwoActions];
}

- (IBAction)threeOrMoreActionsTouchUpInside:(id)sender {
    [self customAlertWithThreeOrMoreActions];
}

@end
