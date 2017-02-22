//
//  CustomAlertBody.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 22/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomAlertBody : NSObject

@property (strong, nullable) NSString *title;
@property (strong, nullable) NSString *message;

#pragma mark - Instantiation
+ (instancetype)bodyWithTitle:(NSString *)title message:(NSString *)message;

@end
