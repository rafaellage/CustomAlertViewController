//
//  UIColor+Extensions.h
//  eWallet
//
//  Created by Marcelo Mendes Pereira on 4/26/16.
//  Copyright © 2016 bocato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extensions)

+ (UIColor *)colorWithHex:(unsigned)hex;

+ (UIColor *)colorWithHexString:(NSString *)hex;

+ (UIColor *)randomColor;

@end
