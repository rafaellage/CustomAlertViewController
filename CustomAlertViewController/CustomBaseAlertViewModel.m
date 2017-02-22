//
//  CustomBaseAlertViewModel.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 21/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "CustomBaseAlertViewModel.h"

@implementation CustomBaseAlertViewModel

#pragma mark - Initialization
+ (instancetype)initWithImage:(UIImage *)image {
    CustomBaseAlertViewModel *customBaseAlertViewModel = [CustomBaseAlertViewModel new];
    customBaseAlertViewModel.image = image;
    return customBaseAlertViewModel;
}

+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message{
    CustomBaseAlertViewModel *customBaseAlertViewModel = [CustomBaseAlertViewModel new];
    customBaseAlertViewModel.image = image;
    [customBaseAlertViewModel addBody:[CustomAlertBody bodyWithTitle:title message:message]];
    return customBaseAlertViewModel;
}

#pragma mark - Helpers
- (void)addAction:(CustomAlertAction *)action{
    if(self.actions == nil){
        self.actions = [NSMutableArray<CustomAlertAction *> new];
    }
    
    [self.actions addObject:action];
}

- (void)addBody:(CustomAlertBody *)body {
    if(self.bodyArray == nil){
        self.bodyArray = [NSMutableArray<CustomAlertBody *> new];
    }
    
    [self.bodyArray addObject:body];
}

@end
