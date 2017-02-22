//
//  CustomAlertBody.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 22/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "CustomAlertBody.h"

@implementation CustomAlertBody

+ (instancetype)bodyWithTitle:(NSString *)title message:(NSString *)message {
    CustomAlertBody *body = [CustomAlertBody new];
    body.title = title;
    body.message = message;
    return body;
}

@end
