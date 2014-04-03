//
//  CustomHeader.m
//  CoreGraphicTutorial
//
//  Created by Xu Xian on 14-4-1.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "CustomHeader.h"

#import "Common.h"

@interface CustomHeader()
{
    CGRect _coloredBoxRect;
    CGRect _paperRect;
}

@end


@implementation CustomHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.opaque = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _titleLabel.shadowOffset = CGSizeMake(0, -1);
        
        [self addSubview:_titleLabel];
        
        _lightColor = [UIColor colorWithRed:105.0/255.0 green:179.0/255.0 blue:216.0/255.0 alpha:1.0];
        _darkColor = [UIColor colorWithRed:21.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1.0];
    }
    return self;
}

-(void)layoutSubviews
{
    CGFloat coloredBoxMargin = 6.0;
    CGFloat coloredBoxHeight = 40.0;
    
    _coloredBoxRect = CGRectMake(coloredBoxMargin,
                                 coloredBoxMargin,
                                 self.bounds.size.width - coloredBoxMargin * 2,
                                 coloredBoxHeight);
    
    CGFloat paperMargin = MARGIN_TABLE_VERTICAL;
    _paperRect = CGRectMake(paperMargin,
                            CGRectGetMaxY(_coloredBoxRect),
                            self.bounds.size.width - paperMargin * 2,
                            self.bounds.size.height - CGRectGetMaxY(_coloredBoxRect));
    
    _titleLabel.frame = _coloredBoxRect;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    UIColor *redColor = [UIColor redColor];
//    UIColor *greenColor = [UIColor greenColor];
//    
//    CGContextSaveGState(context);
//    CGContextSetFillColorWithColor(context, redColor.CGColor);
//    CGContextFillRect(context, _coloredBoxRect);
//    
//    CGContextSetFillColorWithColor(context, greenColor.CGColor);
//    CGContextFillRect(context, _paperRect);
//    CGContextRestoreGState(context);
    
    UIColor *whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    CGContextSetFillColorWithColor(context, whiteColor.CGColor);
    CGContextFillRect(context, _paperRect);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context,
                                CGSizeMake(0,2),
                                3.0,
                                shadowColor.CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, _coloredBoxRect);
    CGContextRestoreGState(context);
    
    drawGlossAndGradient(context, _coloredBoxRect, _lightColor.CGColor, _darkColor.CGColor);
    CGContextSetStrokeColorWithColor(context, self.darkColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, rectFor1PxStroke(_coloredBoxRect));
    
//    //draw gradient
//    // 创建起点颜色
//    CGColorSpaceRef space= CGColorSpaceCreateDeviceRGB();
//    NSArray *colors = [NSArray arrayWithObjects:
//                       [UIColor whiteColor].CGColor,
//                       [UIColor blackColor].CGColor,
//                       nil];
//    
//    CGGradientRef gradientRef = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, (CGFloat []){0.0,1.0});
//    // Drawing code
//    
//    //draw linear gradient
//    CGPoint startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
//    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
//    
//    CGContextSaveGState(context);
//    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, 0);
//    CGContextRestoreGState(context);
//    
//    CGColorSpaceRelease(space);
//    CGGradientRelease(gradientRef);
}

@end
