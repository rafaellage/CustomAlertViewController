//
//  TwoButtonsCustomAlertTableViewCell.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "TwoButtonsCustomAlertTableViewCell.h"

@interface TwoButtonsCustomAlertTableViewCell()

#pragma mark - Properties
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation TwoButtonsCustomAlertTableViewCell

#pragma mark - LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Configuration
- (void)configureLeftButtonWithTitle:(NSString *)title{
    [self.leftButton setTitle:title forState:UIControlStateNormal];
}

- (void)configureRightButtonWithTitle:(NSString *)title{
    [self.rightButton setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Button Actions
- (IBAction)leftButtonTouchUpInside:(id)sender {
    [self.delegate didClickLeftButtonOnCustomAlert:self];
}

- (IBAction)rightButtonTouchUpInside:(id)sender {
    [self.delegate didClickRightButtonOnCustomAlert:self];
}


@end
