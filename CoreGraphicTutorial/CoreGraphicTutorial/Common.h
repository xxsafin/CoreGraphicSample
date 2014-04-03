//
//  Common.h
//  CoreGraphicTutorial
//
//  Created by Xu Xian on 14-3-31.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MARGIN_TABLE_VERTICAL 9.0
//check ios version
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface Common : NSObject

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);
CGRect rectFor1PxStroke(CGRect rect);
void draw1PxStroke(CGContextRef context, CGPoint startP, CGPoint endP, CGColorRef color);

void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

CGPathRef createArcPathFromBottomOfRect(CGRect rect, CGFloat arcHeight);

@end
