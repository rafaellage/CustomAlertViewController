//
//  CustomAlertMaterialTextFieldTableViewCell.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 23/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAMaterialTextField.h"

@interface CustomAlertMaterialTextFieldTableViewCell : UITableViewCell

#pragma mark - Properties
@property (strong, nonatomic) IBOutlet MAMaterialTextField *textField;

#pragma mark - Configuration
- (void)configureWithTextFieldWithPlaceHolder:(NSString *)placeholder;

@end
