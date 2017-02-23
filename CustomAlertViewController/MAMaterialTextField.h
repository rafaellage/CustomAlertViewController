//
//  MAMaterialTextField.h
//  eWallet
//
//  Created by Marcelo Mendes Pereira on 4/25/16.
//  Copyright © 2016 Zup IT. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface MAMaterialTextField : UITextField<UITextFieldDelegate>

@property (strong, nonatomic) IBInspectable UIColor *defaultColor;
@property (strong, nonatomic) IBInspectable UIColor *onErrorColor;
@property (strong, nonatomic) IBInspectable NSString *tooltip;
@property (nonatomic) BOOL isValid;
@property (strong, nonatomic) UIView *vLeftView;
@property (strong, nonatomic) UIView *vRightView;
@property (nonatomic) NSInteger floatingLabelOffset;

- (NSAttributedString *)attributedPlaceholderForFistResponder:(BOOL)firstResponder;

@end
