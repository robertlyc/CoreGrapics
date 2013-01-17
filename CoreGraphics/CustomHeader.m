//
//  CustomHeader.m
//  CoreGraphics
//
//  Created by RoBeRt on 13-1-17.
//  Copyright (c) 2013年 RoBeRt. All rights reserved.
//

#import "CustomHeader.h"
#import "Common.h"

@interface CustomHeader ()

@end

@implementation CustomHeader {
    CGRect coloredBoxRect;
    CGRect paperRect;
}

@synthesize titleLabel = _titleLabel;
@synthesize lightColor = _lightColor;
@synthesize darkColor = _darkColor;

- (id)init {
    if ((self = [super init])) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.opaque = NO;
        self.titleLabel.textAlignment = UITextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        self.titleLabel.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:self.titleLabel];
        
        _lightColor = [UIColor colorWithRed:105.0/255.0 green:179.0/255.0 blue:216.0/255.0 alpha:1.0];
        _darkColor = [UIColor colorWithRed:21.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1.0];
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat coloredBoxMargin = 6.0;
    CGFloat coloredBoxHeight = 40.0;
    coloredBoxRect = CGRectMake(coloredBoxMargin,
                                coloredBoxMargin,
                                self.bounds.size.width - coloredBoxMargin*2,
                                coloredBoxHeight);
    
    CGFloat paperMargin = 9.0;
    paperRect = CGRectMake(paperMargin,
                           CGRectGetMaxY(coloredBoxRect),
                           self.bounds.size.width - paperMargin*2,
                           self.bounds.size.height - CGRectGetMaxY(coloredBoxRect));
    
    self.titleLabel.frame = coloredBoxRect;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    CGColorRef lightColor = self.lightColor.CGColor;
    CGColorRef darkColor = self.darkColor.CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5].CGColor;
    
    CGContextSetFillColorWithColor(context, whiteColor);
    CGContextFillRect(context, paperRect);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor);
    CGContextSetFillColorWithColor(context, lightColor);
    CGContextFillRect(context, coloredBoxRect);
    CGContextRestoreGState(context);
    
    
    drawGlossAndGradient(context, coloredBoxRect, lightColor, darkColor);
    CGContextSetStrokeColorWithColor(context, darkColor);
    CGContextStrokeRectWithWidth(context, rectFor1PxStroke(coloredBoxRect), 1.0);
}


@end
