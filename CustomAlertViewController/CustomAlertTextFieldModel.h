//
//  CustomAlertTextFieldModel.h
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 23/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAMaterialTextField.h"

@interface CustomAlertTextFieldModel : NSObject

#pragma mark - Properties
@property (strong, nonatomic) NSString *placeHolder;
@property (strong, nonatomic) MAMaterialTextField *textField;

#pragma mark - Instantiation
+ (instancetype)initWithPlaceHolder:(NSString *)placeHolder;

@end
