//
//  CustomAlertAction.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "CustomAlertAction.h"

@implementation CustomAlertAction

#pragma mark - Instantiation
+ (instancetype)actionWithTitle:(nullable NSString *)title handler:(void (^ __nullable)(CustomAlertAction *_Nullable action))handler{
    CustomAlertAction *customAlertAction = [CustomAlertAction new];
    customAlertAction.title = title;
    customAlertAction.handler = handler;
    return customAlertAction;
}

@end
