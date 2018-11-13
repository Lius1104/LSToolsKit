//
//  NSMutableArray+LSMove.h
//  LighterController
//
//  Created by ejiang on 2017/2/23.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 向 NSMutableArray 中添加移动 Object 的方法
 */
@interface NSMutableArray (LSMove)

/**
 移动可变数组中的某一元素到数组中的指定位置

 @param fromIndex 需要移动的元素的当前位置
 @param toIndex 需要移动到的位置
 */
- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
