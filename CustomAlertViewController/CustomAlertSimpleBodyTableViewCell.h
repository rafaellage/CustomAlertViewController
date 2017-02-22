//
//  CustomAlertSimpleBodyTableViewCell.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 22/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertSimpleBodyTableViewCell : UITableViewCell

#pragma mark - Outlets
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

#pragma mark - Configuration
- (void)configureWithTitle:(NSString *)title message:(NSString *)message;

@end
