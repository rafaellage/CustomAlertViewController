//
//  MAMaterialTextField.m
//  eWallet
//
//  Created by Marcelo Mendes Pereira on 4/25/16.
//  Copyright © 2016 Zup IT. All rights reserved.
//

#import "MAMaterialTextField.h"
#import "UIColor+Extensions.h"

static CGFloat const kNormalBorderBottomWidth           = 2;
static CGFloat const kSelectedBorderBottomWidth         = 2;

@interface MAMaterialTextField ()

@property (strong, nonatomic) UILabel *floatingLabel;
@property (nonatomic) BOOL isFloatingLabelVisible;
@property (nonatomic) BOOL isFloatingLabelAnimating;
@property (strong, nonatomic) UIView *normalBorderBottom;
@property (strong, nonatomic) UIView *selectedBorderBottom;
@property (strong, nonatomic) id<UITextFieldDelegate> proxyDelegate;

@end

@implementation MAMaterialTextField

//@dynamic delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.attributedPlaceholder = [self attributedPlaceholderForFistResponder:self.isFirstResponder];
    
    self.isValid = YES;
    
    self.delegate = self;
    
    self.floatingLabelOffset = 0;
    
    self.floatingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -16, self.bounds.size.width, 16)];
    self.floatingLabel.font = [UIFont systemFontOfSize:14];
    self.floatingLabel.text = self.tooltip.length > 0 ? self.tooltip : (self.placeholder ?: @"");
    self.floatingLabel.textColor = self.defaultColor ?: UIColor.lightGrayColor;
    self.floatingLabel.alpha = 0;
    [self addSubview:self.floatingLabel];
    
    self.borderStyle = UITextBorderStyleNone;
    self.normalBorderBottom = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - kNormalBorderBottomWidth, self.bounds.size.width, kNormalBorderBottomWidth)];
    self.normalBorderBottom.backgroundColor =   self.defaultColor ?: UIColor.grayColor;
    [self addSubview:self.normalBorderBottom];
    
    self.selectedBorderBottom = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - kSelectedBorderBottomWidth , self.bounds.size.width, kSelectedBorderBottomWidth)];
    self.selectedBorderBottom.backgroundColor = self.defaultColor ?: UIColor.darkGrayColor;
    self.selectedBorderBottom.alpha = 0;
    [self addSubview:self.selectedBorderBottom];    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.normalBorderBottom.frame = CGRectMake(0, self.bounds.size.height - kNormalBorderBottomWidth, self.bounds.size.width, kNormalBorderBottomWidth);
    self.selectedBorderBottom.frame = CGRectMake(0, self.bounds.size.height - kSelectedBorderBottomWidth, self.bounds.size.width, kSelectedBorderBottomWidth);
}

- (NSAttributedString *)attributedPlaceholderForFistResponder:(BOOL)firstResponder {
    UIColor *color = [UIColor colorWithHexString:@"6D6D6D"];
    if (firstResponder) {
        color = [color colorWithAlphaComponent:0];
    }
    NSString *placeholderString = self.placeholder.length > 0 ? self.placeholder : @"";
    NSMutableAttributedString *attribString = [[NSMutableAttributedString alloc] initWithString:placeholderString];
    [attribString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:self.font.pointSize] range:NSMakeRange(0, placeholderString.length)];
    [attribString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, placeholderString.length)];
    return attribString;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + (self.vLeftView != nil ? 22 + 4 : 0 ), bounds.origin.y + 4, bounds.size.width, bounds.size.height);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + (self.vLeftView != nil ? 22 + 4 : 0 ), bounds.origin.y + 6, bounds.size.width, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
    [super setDelegate:self];
    self.proxyDelegate = ![delegate isEqual:self] ? delegate : nil;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    self.textColor = enabled ? UIColor.blackColor : UIColor.lightGrayColor;
    self.normalBorderBottom.backgroundColor = enabled ? UIColor.lightGrayColor : [UIColor.lightGrayColor colorWithAlphaComponent:0.3];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    text.length > 0 || self.isFirstResponder ? [self showFloatingLabel] : [self hideFloatingLabel];
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    self.floatingLabel.text = self.tooltip.length > 0 ? self.tooltip : (self.placeholder ?: @"");
}

- (void)setTooltip:(NSString *)tooltip {
    _tooltip = tooltip;
    self.floatingLabel.text = _tooltip.length > 0 ? _tooltip : (self.placeholder ?: @"");
}

- (void)setIsValid:(BOOL)isValid {
    [self willChangeValueForKey:@"isValid"];
    _isValid = isValid;
    self.floatingLabel.textColor = !_isValid ? (self.onErrorColor ?: self.defaultColor) : self.defaultColor;
    self.normalBorderBottom.backgroundColor = !_isValid ? (self.onErrorColor ?: UIColor.grayColor) : UIColor.grayColor;
    self.selectedBorderBottom.backgroundColor = !_isValid ? (self.onErrorColor ?: self.defaultColor) : self.defaultColor;
    [self didChangeValueForKey:@"isValid"];
}

- (BOOL)becomeFirstResponder {
    BOOL becomeFirstResponder = [super becomeFirstResponder];
    self.attributedPlaceholder = [self attributedPlaceholderForFistResponder:becomeFirstResponder];
    return becomeFirstResponder;
}

- (BOOL)resignFirstResponder {
    BOOL resignFirstResponder = [super resignFirstResponder];
    self.attributedPlaceholder = [self attributedPlaceholderForFistResponder:!resignFirstResponder];
    return resignFirstResponder;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.proxyDelegate && [self.proxyDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.proxyDelegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self showSelectedBottomBorder];
    [self showFloatingLabel];
    
    if (self.proxyDelegate && [self.proxyDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.proxyDelegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (self.proxyDelegate && [self.proxyDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [self.proxyDelegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self hideSelectedBottomBorder];
    
    self.text.length > 0 ? [self showFloatingLabel] : [self hideFloatingLabel];
    
    if (self.proxyDelegate && [self.proxyDelegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.proxyDelegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSMutableString *newString = [NSMutableString stringWithString:textField.text];
    [newString replaceCharactersInRange:range withString:string];
    
    newString.length > 0 || textField.isFirstResponder ? [self showFloatingLabel] : [self hideFloatingLabel];
    
    if (self.proxyDelegate && [self.proxyDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.proxyDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    BOOL textFieldShouldClear_ = YES;
    if (self.proxyDelegate && [self.proxyDelegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        textFieldShouldClear_ = [self.proxyDelegate textFieldShouldClear:textField];
    }
    
    textFieldShouldClear_ ? [self hideFloatingLabel] : nil;
    
    return textFieldShouldClear_;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.proxyDelegate && [self.proxyDelegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.proxyDelegate textFieldShouldReturn:textField];
    }
    return YES;
}

- (void)showSelectedBottomBorder {
    [UIView animateWithDuration:.5 animations:^{
        self.selectedBorderBottom.alpha = 1;
        
    } completion:^(BOOL finished) {}];
}

- (void)hideSelectedBottomBorder {
    [UIView animateWithDuration:.5 animations:^{
        self.selectedBorderBottom.alpha = 0;
        
    } completion:^(BOOL finished) {}];
}

- (void)showFloatingLabel {
    if (self.isFloatingLabelVisible || self.isFloatingLabelAnimating) {
        return;
    }
    
    self.isFloatingLabelAnimating = YES;
    
    CGFloat xPos = self.leftView ? self.leftView.frame.size.width : 0;
    xPos += 4 + self.floatingLabelOffset;
    CGRect frame = self.bounds;
    frame.origin.x = xPos;
    self.floatingLabel.frame = frame;
    [UIView animateWithDuration:.3 animations:^{
        self.floatingLabel.alpha = 1;
        self.floatingLabel.frame = CGRectMake(xPos, 0, self.bounds.size.width, 16);
    } completion:^(BOOL finished) {
        if (finished) {
            self.isFloatingLabelVisible = YES;
            self.isFloatingLabelAnimating = NO;
        }
    }];
}

- (void)hideFloatingLabel {
    if (!self.isFloatingLabelVisible || self.isFloatingLabelAnimating) {
        return;
    }
    
    self.isFloatingLabelAnimating = YES;
    
    CGFloat xPos = self.leftView ? self.leftView.frame.size.width : 0;
    xPos += 4;
    CGRect frame = CGRectMake(xPos, 0, self.bounds.size.width, 16);
    self.floatingLabel.frame = frame;
    [UIView animateWithDuration:.3 animations:^{
        self.floatingLabel.alpha = 0;
        CGRect frame = self.bounds;
        frame.origin.x = xPos;
        self.floatingLabel.frame = frame;
        
    } completion:^(BOOL finished) {
        if (finished) {
            self.isFloatingLabelVisible = NO;
            self.isFloatingLabelAnimating = NO;
        }
    }];
}

-(void) setFloatingLabelOffset:(NSInteger)floatingLabelOffset {
    _floatingLabelOffset = floatingLabelOffset;
}

@end
