//
//  CustomHeader.m
//  CoreGraphics
//
//  Created by RoBeRt on 13-1-17.
//  Copyright (c) 2013年 RoBeRt. All rights reserved.
//

#import "CustomHeader.h"

@implementation CustomHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef redColor = [UIColor redColor].CGColor;
    
    CGContextSetFillColorWithColor(context, redColor);
    CGContextFillRect(context, self.bounds);
}


@end
