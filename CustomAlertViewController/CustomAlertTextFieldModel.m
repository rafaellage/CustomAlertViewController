//
//  CustomAlertTextFieldModel.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 23/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "CustomAlertTextFieldModel.h"

@implementation CustomAlertTextFieldModel

+ (instancetype)initWithPlaceHolder:(NSString *)placeHolder {
    CustomAlertTextFieldModel *model = [CustomAlertTextFieldModel new];
    model.placeHolder = placeHolder;
    return model;
}

@end
