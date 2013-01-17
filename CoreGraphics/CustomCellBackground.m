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
    CGColorRef lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;
    CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0].CGColor;
    CGRect paperRect = self.bounds;
    
    drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
    
    CGRect strokeRect = paperRect;
    strokeRect.size.height -= 1;
    strokeRect = rectFor1PxStroke(strokeRect);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);
    
    //Add at bottom
    CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height -1);
    draw1PxStroke(context, startPoint, endPoint, separatorColor);
}

//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGColorRef whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
//    CGColorRef lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;
//    //CGColorRef redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0].CGColor;
//    CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0].CGColor;
//    
//    CGRect paperRect = self.bounds;
//    
//    // Fill with gradient
//    drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
//    
//    // Add white 1 px stroke
//    CGRect strokeRect = paperRect;
//    strokeRect.size.height -= 1;
//    strokeRect = rectFor1PxStroke(strokeRect);
//    
//    CGContextSetStrokeColorWithColor(context, whiteColor);
//    CGContextSetLineWidth(context, 1.0);
//    CGContextStrokeRect(context, strokeRect);
//    
//    // Add separator
//    CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
//    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
//    draw1PxStroke(context, startPoint, endPoint, separatorColor);
//    
//}


@end
