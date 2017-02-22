//
//  CustomAlertAction.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertAction : NSObject

#pragma mark - Properties
@property (strong, nullable) NSString *title;
@property (copy) void (^ __nullable handler)(CustomAlertAction *_Nullable action);

#pragma mark - Instantiation
+ (instancetype)actionWithTitle:(nullable NSString *)title handler:(void (^ __nullable)(CustomAlertAction *_Nullable action))handler;

@end
