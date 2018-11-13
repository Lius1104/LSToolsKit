//
//  LSButton.h
//  LSKitDemo
//
//  Created by Lius on 2017/5/5.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 
    扩展点击范围的方向, 可多选
 */
typedef NS_OPTIONS(NSUInteger, ExpandingDirectionType) {
    /// 不扩大响应范围
    ExpandingDirectionNone                  = 1 << 0,
    /// 向上扩大响应区域
    ExpandingDirectionTop                   = 1 << 1,
    /// 向下扩大响应区域
    ExpandingDirectionBottom                = 1 << 2,
    /// 向左扩大响应区域
    ExpandingDirectionLeft                  = 1 << 3,
    /// 向右扩大响应区域
    ExpandingDirectionRight                 = 1 << 4,
    /// 全方向扩大响应区域
    ExpandingDirectionAll                   = 0x0000001E
};
/**
 扩大指定方向的点击范围 的 button
 */
@interface LSButton : UIButton
/**
 expendX 是 期望的单边扩大的px，不是扩大范围后的总 width
 */
@property (nonatomic, assign) CGFloat expendX;

/**
 expendX 是 期望的单边扩大的px，不是扩大范围后的总 height
 */
@property (nonatomic, assign) CGFloat expendY;

/**
 when use it, you can decide one or more direction that you want expand. default is ExpandingDirectionNone.
 */
@property (nonatomic, assign) ExpandingDirectionType expendDirection;

/**
 按钮的圆角半径
 */
@property (nonatomic, assign) CGFloat ls_cornerRadius;


@end
