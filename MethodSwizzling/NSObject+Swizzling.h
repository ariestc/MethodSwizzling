//
//  NSObject+Swizzling.h
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+(void)swizzleMethods:(Class)class originalSelector:(SEL)originalSel swizzleSelector:(SEL)swizzelSel;

@end
