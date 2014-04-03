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
//-(void)drawRect:(CGRect)rect
//{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //Fill the background with gray:
//    CGContextSetRGBFillColor(ctx, 0.5, 0.5, 0.5, 1);
//    CGContextFillRect(ctx, self.bounds);
//    CGContextAddRect(ctx, self.bounds);
//    //Add some rectangles:
////    CGContextAddRect(ctx, CGRectMake(10, 10, 100, 100));
////    CGContextAddRect(ctx, CGRectMake(120, 120, 50, 100));
//    
////    CGContextAddRect(ctx, CGRectMake(90, 20, 70, 140));
//    CGContextAddRect(ctx, CGRectMake(10, 10, 160, 160));
////    CGContextAddRect(ctx, CGRectMake(20, 20, 140, 140));
////    CGContextAddRect(ctx, CGRectMake(30, 30, 120, 120));
////    CGContextAddRect(ctx, CGRectMake(40, 40, 100, 100));
////    CGContextAddRect(ctx, CGRectMake(50, 50, 80, 80));
////    CGContextAddRect(ctx, CGRectMake(60, 60, 60, 60));
////    CGContextAddRect(ctx, CGRectMake(70, 70, 40, 40));
////    CGContextAddRect(ctx, CGRectMake(80, 80, 20, 20));
//    //Clip:
//    CGContextEOClip(ctx);
////    CGContextAddRect(ctx, self.bounds);
//    CGContextAddRect(ctx, CGRectMake(20, 20, 160, 160));
////    CGContextEOClip(ctx);
//    
//    //Fill the entire bounds with red:
//    CGContextSetRGBFillColor(ctx, 1.0, 0.0, 0.0, 1.0);
////    CGContextFillRect(ctx, self.bounds);
//    CGContextFillPath(ctx);
//}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //draw arc
    CGContextSaveGState(context);
    
    UIColor *whiteColor = [UIColor whiteColor];
    UIColor *lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    UIColor *darkGrayColor = [UIColor colorWithRed:187.0/255.0 green:187.0/255.0 blue:187.0/255.0 alpha:1.0];
    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    CGFloat paperMargin = MARGIN_TABLE_VERTICAL;
    CGRect paperRect = CGRectMake(self.bounds.origin.x + paperMargin,
                                  self.bounds.origin.y,
                                  self.bounds.size.width - paperMargin * 2,
                                  self.bounds.size.height);
    
    CGRect arcRect = paperRect;
    arcRect.size.height = 8.0;
    
    CGPathRef path =createArcPathFromBottomOfRect(arcRect, 4.f);
    CGContextAddPath(context, path);
    CGContextClip(context);
    drawLinearGradient(context, rect, lightGrayColor.CGColor, darkGrayColor.CGColor);
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
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0f, shadowColor.CGColor);
    
    CGContextFillPath(context);
    
    CFRelease(path);
}

@end
