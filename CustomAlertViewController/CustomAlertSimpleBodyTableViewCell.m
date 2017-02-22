//
//  CustomAlertSimpleBodyTableViewCell.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 22/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "CustomAlertSimpleBodyTableViewCell.h"

@implementation CustomAlertSimpleBodyTableViewCell

#pragma mark - View LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Configuration
- (void)configureWithTitle:(NSString *)title message:(NSString *)message {
    self.titleLabel.text = title;
    self.messageLabel.text = message;
}

@end
