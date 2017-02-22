//
//  RoundedBorderButton.m
//  PineOnline
//
//  Created by Eduardo Sanches Bocato on 14/02/17.
//  Copyright © 2017 Zup IT. All rights reserved.
//

#import "RoundedBorderButton.h"

@implementation RoundedBorderButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self layoutIfNeeded];
    self.layer.cornerRadius = 6;
    self.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
