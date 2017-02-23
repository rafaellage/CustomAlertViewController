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
#import "CustomAlertTextFieldModel.h"

@interface CustomBaseAlertViewModel: NSObject

#pragma mark - Properties
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSMutableArray<CustomAlertBody *> *bodyArray;
@property (strong, nonatomic) NSMutableArray<CustomAlertTextFieldModel *> *textFields;
@property (strong, nonatomic) NSMutableArray<CustomAlertAction *> *actions;

#pragma mark - Initialization
+ (instancetype)initWithImage:(UIImage *)image;
+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;
+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message textField:(CustomAlertTextFieldModel *)textField;

#pragma mark - Helpers
- (void)addBody:(CustomAlertBody *)body;
- (void)addTextField:(CustomAlertTextFieldModel *)textField;
- (void)addAction:(CustomAlertAction *)action;


@end
