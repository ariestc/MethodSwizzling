//
//  NSArray+SwizzleMethod.m
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "NSArray+SwizzleMethod.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSArray (SwizzleMethod)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //__NSArray0  __NSSingleObjectArrayI  __NSArrayI
        
        [self swizzleMethods:objc_getClass("__NSArrayI") originalSelector:@selector(objectAtIndex:) swizzleSelector:@selector(safeObjectAtIndex:)];
        
        [self swizzleMethods:objc_getClass("__NSArrayI") originalSelector:@selector(objectAtIndexedSubscript:) swizzleSelector:@selector(safeObjectAtIndexedSubscript:)];
        
    });
}



-(id)safeObjectAtIndexedSubscript:(NSUInteger)index
{
    if (self.count == 0) {
        
        NSLog(@"%s can't get any object from an empty array",__FUNCTION__);
        return nil;
    }
    
    if (index>=self.count) {
        
        NSLog(@"%s indexedSubscript is out of bound in array",__FUNCTION__);
        return nil;
    }
    
    return [self safeObjectAtIndexedSubscript:index];
}


-(id)safeObjectAtIndex:(NSUInteger)index
{
    if (self.count == 0) {
        
        NSLog(@"%s can't get any object from an empty array",__FUNCTION__);
        
        return nil;
    }
    
    if (index>=self.count) {
        
        NSLog(@"%s index is out of bound in array",__FUNCTION__);
        return nil;
    }
    
    return [self safeObjectAtIndex:index];
}

@end
