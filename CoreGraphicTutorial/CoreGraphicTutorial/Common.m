//
//  Common.m
//  CoreGraphicTutorial
//
//  Created by Xu Xian on 14-3-31.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "Common.h"

@implementation Common

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGFloat locations[] = {0.0, 0.6, 0.7, 0.8, 0.9, 1.0};
    
//    CGFloat locations[] = {0.0, 0.6, 0.7, 0.8, 0.9, 1.0};
//    CGColorRef color1 = [UIColor redColor].CGColor;
//    CGColorRef color2 = [UIColor orangeColor].CGColor;
//    CGColorRef color3 = [UIColor yellowColor].CGColor;
//    CGColorRef color4 = [UIColor greenColor].CGColor;
//    CGColorRef color5 = [UIColor blueColor].CGColor;
//    CGColorRef color6 = [UIColor purpleColor].CGColor;
    
//    NSArray *colors = @[(__bridge id)color1,
//                        (__bridge id)color2,
//                        (__bridge id)color3,
//                        (__bridge id)color4,
//                        (__bridge id)color5,
//                        (__bridge id)color6];
    
    NSArray *colors = @[(__bridge id)startColor,
                        (__bridge id)endColor];
    
//    NSArray *colors = @[(__bridge id)startColor, (__bridge id)endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, nil);
    
    //draw linear gradient
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

CGRect rectFor1PxStroke(CGRect rect)
{
    return CGRectInset(rect, 0.5, 0.5);
    
}

void draw1PxStroke(CGContextRef context, CGPoint startP, CGPoint endP, CGColorRef color)
{
    CGContextSaveGState(context);
    
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 1.f);
    CGContextMoveToPoint(context, startP.x + 0.5, startP.y + 0.5);
    CGContextAddLineToPoint(context, endP.x + 0.5, endP.y + 0.5);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
}

@end
