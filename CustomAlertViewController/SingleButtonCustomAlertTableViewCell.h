//
//  SingleButtonCustomAlertTableViewCell.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SingleButtonCustomAlertTableViewCell;

@protocol SingleButtonCustomAlertTableViewCellDelegate <NSObject>
- (void)didClickSingleButtonOnCustomAlert:(SingleButtonCustomAlertTableViewCell *)cell;
@end

@interface SingleButtonCustomAlertTableViewCell : UITableViewCell

#pragma mark - Properties
@property (strong, nonatomic) id<SingleButtonCustomAlertTableViewCellDelegate> delegate;

#pragma mark - Configuration
- (void)configureButtonWithTitle:(NSString *)title;

@end
