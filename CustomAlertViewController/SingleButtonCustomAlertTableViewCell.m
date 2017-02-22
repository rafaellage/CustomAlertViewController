//
//  SingleButtonCustomAlertTableViewCell.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "SingleButtonCustomAlertTableViewCell.h"

@interface SingleButtonCustomAlertTableViewCell()
@property (strong, nonatomic) IBOutlet UIButton *button;
@end

@implementation SingleButtonCustomAlertTableViewCell

#pragma mark - LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Configuration
- (void)configureButtonWithTitle:(NSString *)title {
    [self.button setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Button Actions
- (IBAction)buttonTouchUpInside:(id)sender {
    [self.delegate didClickSingleButtonOnCustomAlert:self];
}


@end
