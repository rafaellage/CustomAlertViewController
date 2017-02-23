//
//  CustomAlertMaterialTextFieldTableViewCell.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 23/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "CustomAlertMaterialTextFieldTableViewCell.h"

@implementation CustomAlertMaterialTextFieldTableViewCell

#pragma mark - View LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Configuration
- (void)configureWithTextFieldWithPlaceHolder:(NSString *)placeholder {
    self.textField.placeholder = placeholder;
    [self layoutSubviews];
}

@end
