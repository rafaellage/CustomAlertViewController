//
//  TwoButtonsCustomAlertTableViewCell.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TwoButtonsCustomAlertTableViewCell;

@protocol TwoButtonsCustomAlertTableViewCellDelegate <NSObject>
- (void)didClickLeftButtonOnCustomAlert:(TwoButtonsCustomAlertTableViewCell *)cell;
- (void)didClickRightButtonOnCustomAlert:(TwoButtonsCustomAlertTableViewCell *)cell;
@end

@interface TwoButtonsCustomAlertTableViewCell : UITableViewCell

#pragma mark - Properties
@property (strong, nonatomic) id <TwoButtonsCustomAlertTableViewCellDelegate> delegate;

#pragma mark - Configuration
- (void)configureLeftButtonWithTitle:(NSString *)title;
- (void)configureRightButtonWithTitle:(NSString *)title;

@end
