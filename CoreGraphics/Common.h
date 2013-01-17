//
//  Common.h
//  CoreGraphics
//
//  Created by RoBeRt on 13-1-17.
//  Copyright (c) 2013年 RoBeRt. All rights reserved.
//

#import <Foundation/Foundation.h>

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

CGRect rectFor1PxStroke(CGRect rect);

void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color);

void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);