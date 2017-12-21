//
//  UIImage+swizzleMethod.m
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "UIImage+swizzleMethod.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation UIImage (swizzleMethod)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
    [self swizzleMethods:object_getClass([self class]) originalSelector:@selector(imageNamed:) swizzleSelector:@selector(customImageNamed:)];
        
    });
}


+(UIImage *)customImageNamed:(NSString *)name
{
   return  [self customImageNamed:[NSString stringWithFormat:@"%@%@",@"new_",name]];
}

@end
