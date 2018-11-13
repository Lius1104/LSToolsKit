//
//  NSMutableArray+LSMove.m
//  LighterController
//
//  Created by ejiang on 2017/2/23.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "NSMutableArray+LSMove.h"

@implementation NSMutableArray (LSMove)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (toIndex != fromIndex && fromIndex < [self count] && toIndex <= [self count]) {
        id obj = [self objectAtIndex:fromIndex];
        [self removeObjectAtIndex:fromIndex];
        if (toIndex >= [self count] + 1) {
            [self addObject:obj];
        } else {
            if (fromIndex < toIndex) {
                [self insertObject:obj atIndex:toIndex - 1];
            } else {
                [self insertObject:obj atIndex:toIndex];
            }
        }
    }
}

@end
