//
//  BaseCustomAlertViewController.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertAction.h"
#import "CustomAlertBody.h"

@interface BaseCustomAlertViewController : UIViewController

#pragma mark - Instantiation
+ (instancetype)alertControllerWithImage:(UIImage *)image;
+ (instancetype)alertControllerWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

#pragma mark - Configuration
- (void)addBody:(CustomAlertBody *)body;
- (void)addAction:(CustomAlertAction *)action;
- (NSArray<CustomAlertAction *>*)getActions;

#pragma mark - Helpers
- (void)showInViewController:(UIViewController *)viewController;
- (void)hide;
- (void)hideWithCompletion:(void (^ __nullable)(void))completion;

@end
