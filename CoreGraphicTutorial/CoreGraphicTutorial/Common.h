//
//  Common.h
//  CoreGraphicTutorial
//
//  Created by Xu Xian on 14-3-31.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

@end