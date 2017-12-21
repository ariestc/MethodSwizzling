//
//  NSObject+Swizzling.m
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+(void)swizzleMethods:(Class)class originalSelector:(SEL)originalSel swizzleSelector:(SEL)swizzelSel
{
   Method originalMethod=class_getInstanceMethod(class, originalSel);
   Method swizzelSelMethod=class_getInstanceMethod(class, swizzelSel);
    
    //先尝试给源SEL添加IMP,避免源SEL没有实现IMP的情况
    BOOL isAddMethod=class_addMethod(class, originalSel, method_getImplementation(swizzelSelMethod), method_getTypeEncoding(swizzelSelMethod));
    
    if (isAddMethod) {
        
        //源SEL未实现IMP, 将源SEL的IMP替换为swizzel的SEL的IMP
        class_replaceMethod(class, swizzelSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else
    {
        //源SEL已经有IMP，直接将两个SEL的IMP交换
        method_exchangeImplementations(originalMethod, swizzelSelMethod);
    }
    
}

@end
