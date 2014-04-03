//
//  CustomCellBackground.m
//  CoreGraphicTutorial
//
//  Created by Xu Xian on 14-3-31.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "CustomCellBackground.h"

#import "Common.h"

@implementation CustomCellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.opaque = NO;
//        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    UIColor *whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor *lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    //draw separator line
    UIColor *separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.f];
    
    //draw gradient
    CGRect paperRect = self.bounds;
    if(!SYSTEM_VERSION_LESS_THAN(@"7.0"))
    {
        paperRect = CGRectInset(self.bounds, MARGIN_TABLE_VERTICAL, 0);
//        CGContextSetFillColorWithColor(context, [[UIColor clearColor] colorWithAlphaComponent:0.1].CGColor);
//        CGContextFillRect(context, self.bounds);
    }
    
    if (self.selected) {
        drawLinearGradient(context, paperRect, lightGrayColor.CGColor, separatorColor.CGColor);
    } else {
        drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    }
    
    //draw stroke
    CGRect strokeRect = paperRect;
    strokeRect.size.height -= 1;
    strokeRect = CGRectInset(strokeRect, 0.5, 0.5);
    
    CGContextSaveGState(context);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextStrokeRectWithWidth(context, strokeRect, 1);
    CGContextRestoreGState(context);
    
    if (self.lastCell) {
        draw1PxStroke(context,
                      CGPointMake(CGRectGetMinX(paperRect), CGRectGetMaxY(paperRect) - 1),
                      CGPointMake(CGRectGetMaxX(paperRect), CGRectGetMaxY(paperRect) - 1),
                      separatorColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        
        CGPoint pointA = CGPointMake(paperRect.origin.x, CGRectGetMaxY(paperRect) - 1);
        CGPoint pointB = CGPointMake(paperRect.origin.x, CGRectGetMinX(paperRect));
        CGPoint pointC = CGPointMake(CGRectGetMaxX(paperRect) -1, paperRect.origin.y);
        CGPoint pointD = CGPointMake(CGRectGetMaxX(paperRect) -1, CGRectGetMaxY(paperRect) -1);
        
        
        draw1PxStroke(context, pointA, pointB, whiteColor.CGColor);
        draw1PxStroke(context, pointB, pointC, whiteColor.CGColor);
        draw1PxStroke(context, pointC, pointD, whiteColor.CGColor);
    }
    
    
}


@end
