//
//  RoundedBorderView.h
//  eWallet
//
//  Created by Marcelo Mendes Pereira on 5/16/16.
//  Copyright © 2016 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface RoundedBorderView : UIView

@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property IBInspectable BOOL hasOuterShadow;

@end
