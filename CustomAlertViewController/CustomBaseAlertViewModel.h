//
//  CustomBaseAlertViewModel.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 21/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertAction.h"
#import "CustomAlertBody.h"

@interface CustomBaseAlertViewModel: NSObject

#pragma mark - Properties
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSMutableArray<CustomAlertAction *> *actions;
@property (strong, nonatomic) NSMutableArray<CustomAlertBody *> *bodyArray;

#pragma mark - Initialization
+ (instancetype)initWithImage:(UIImage *)image;
+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

#pragma mark - Helpers
- (void)addAction:(CustomAlertAction *)action;
- (void)addBody:(CustomAlertBody *)body;

@end
