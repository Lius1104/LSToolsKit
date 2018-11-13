//
//  LSFont.m
//  LSKitDemo
//
//  Created by Lius on 2017/5/26.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "LSFont.h"

#define UIScreenWidth 375  //自己UI设计原型图的手机尺寸宽度(6)

@implementation LSFont

+ (CGFloat)adapterFontOfSize:(CGFloat)fontSize {
    CGFloat size = fontSize;
    size = round(fontSize * [UIScreen mainScreen].bounds.size.width/UIScreenWidth);
    return size;
}

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize {
    CGFloat size = [self adapterFontOfSize:fontSize];
    return [super systemFontOfSize:size];
}

+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize {
    CGFloat size = [self adapterFontOfSize:fontSize];
    return [super boldSystemFontOfSize:size];
}

+ (UIFont *)italicSystemFontOfSize:(CGFloat)fontSize {
    CGFloat size = [self adapterFontOfSize:fontSize];
    return [super italicSystemFontOfSize:size];
}

+ (UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    CGFloat size = [self adapterFontOfSize:fontSize];
    return [super fontWithName:fontName size:size];
}

- (UIFont *)fontWithSize:(CGFloat)fontSize {
    CGFloat size = [LSFont adapterFontOfSize:fontSize];
    return [super fontWithSize:size];
}

@end
