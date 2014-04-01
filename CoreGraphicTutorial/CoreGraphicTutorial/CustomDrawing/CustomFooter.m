//
//  CustomFooter.m
//  CoreGraphicTutorial
//
//  Created by Xu Xian on 14-4-1.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "CustomFooter.h"
#import "Common.h"

@implementation CustomFooter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.opaque = YES;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //draw arc
    CGContextSaveGState(context);
    
    UIColor *whiteColor = [UIColor whiteColor];
    UIColor *lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    UIColor *darkGrayColor = [UIColor colorWithRed:187.0/255.0 green:187.0/255.0 blue:187.0/255.0 alpha:1.0];
    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    CGFloat paperMargin = 9.0;
    CGRect paperRect = CGRectMake(self.bounds.origin.x + paperMargin,
                                  self.bounds.origin.x,
                                  self.bounds.size.width - paperMargin * 2,
                                  self.bounds.size.height);
    
    CGRect arcRect = paperRect;
    arcRect.size.height = 8.0;
    
    CGPathRef path =createArcPathFromBottomOfRect(arcRect, 4.f);
    CGContextAddPath(context, path);
    CGContextClip(context);
    drawLinearGradient(context, paperRect, lightGrayColor.CGColor, darkGrayColor.CGColor);
    CGContextRestoreGState(context);
    
    //add side border lines to this arc shape
    CGPoint pointA = CGPointMake(arcRect.origin.x, arcRect.origin.y);
    CGPoint pointB = CGPointMake(arcRect.origin.x, CGRectGetMaxY(arcRect) - 1);
    CGPoint pointC = CGPointMake(CGRectGetMaxX(arcRect) - 1, CGRectGetMinY(arcRect));
    CGPoint pointD = CGPointMake(CGRectGetMaxX(arcRect) - 1, CGRectGetMaxY(arcRect) - 1);
    
    draw1PxStroke(context, pointA, pointB, whiteColor.CGColor);
    draw1PxStroke(context, pointC, pointD, whiteColor.CGColor);
    
    //add shadow below the arc
    CGContextAddRect(context, paperRect);
    CGContextAddPath(context, path);
    CGContextEOClip(context);
    CGContextAddPath(context, path);
    CGContextSetShadowWithColor(context,
                                CGSizeMake(0, 2),
                                3.0,
                                shadowColor.CGColor);
    CGContextFillPath(context);
    
    CFRelease(path);
}

@end
