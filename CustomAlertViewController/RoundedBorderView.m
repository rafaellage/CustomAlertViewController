//
//  RoundedBorderView.m
//  eWallet
//
//  Created by Marcelo Mendes Pereira on 5/16/16.
//  Copyright © 2016 bocato. All rights reserved.
//

#import "RoundedBorderView.h"

#import "UIColor+Extensions.h"

static CGFloat const kMinCornerRadius = 0.0f;
static CGFloat const kMaxCornerRadius = 24.0f;

static const CGFloat kMinimumBorderWidth = 1;

@implementation RoundedBorderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.clipsToBounds = YES;
    CGFloat cornerRadius = self.cornerRadius;
    cornerRadius = cornerRadius < kMinCornerRadius ? kMinCornerRadius : cornerRadius;
    cornerRadius = cornerRadius > kMaxCornerRadius ? kMaxCornerRadius : cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = self.borderWidth <= kMinimumBorderWidth ? kMinimumBorderWidth : self.borderWidth;
    self.layer.borderColor = (self.borderColor ?: [UIColor clearColor]).CGColor;
    
    if (self.hasOuterShadow) {
        [self setupShadow];
    }
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = (_borderColor ?: [UIColor colorWithHex:0x48C2C9]).CGColor;
}

- (void)setupShadow{
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius= 3.0;
    self.layer.shadowOpacity = 0.5;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
