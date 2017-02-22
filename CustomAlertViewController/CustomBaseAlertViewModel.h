//
//  CustomBaseAlertViewModel.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 21/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertAction.h"

@interface CustomBaseAlertViewModel: NSObject

#pragma mark - Properties
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSMutableArray<CustomAlertAction *> *actions;

#pragma mark - Initialization
+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

#pragma mark - Helpers
- (void)addAction:(CustomAlertAction *)action;

@end
