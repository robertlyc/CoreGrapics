//
//  CustomCellBackground.m
//  CoreGraphics
//
//  Created by RoBeRt on 13-1-17.
//  Copyright (c) 2013年 RoBeRt. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"

@implementation CustomCellBackground

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
    
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    CGColorRef grayColor = [UIColor lightGrayColor].CGColor;
    CGRect paperRect = self.bounds;
    
    drawLinearGradient(context, paperRect, whiteColor, grayColor);
    
    CGRect strokeRect = paperRect;
    strokeRect.size.height -= 1;
    strokeRect = rectFor1PxStroke(paperRect);
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextStrokeRectWithWidth(context, strokeRect, 1.0);
}


@end
