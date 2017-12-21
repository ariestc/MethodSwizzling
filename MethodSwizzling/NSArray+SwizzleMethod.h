//
//  NSArray+SwizzleMethod.h
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SwizzleMethod)

-(id)safeObjectAtIndex:(NSUInteger)index;

-(id)safeObjectAtIndexedSubscript:(NSUInteger)index;

@end
