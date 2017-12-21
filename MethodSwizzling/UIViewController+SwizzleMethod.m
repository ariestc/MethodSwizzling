//
//  UIViewController+SwizzleMethod.m
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "UIViewController+SwizzleMethod.h"
#import "NSObject+Swizzling.h"

@implementation UIViewController (SwizzleMethod)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleMethods:[self class] originalSelector:@selector(viewWillAppear:) swizzleSelector:@selector(myViewWillAppear:)];
        
        [self swizzleMethods:[self class] originalSelector:@selector(viewDidAppear:) swizzleSelector:@selector(myViewDidAppear:)];
    });
}


-(void)myViewWillAppear:(BOOL)animated
{
    NSLog(@"%@--%@",self,@"myViewWillAppear");
}

-(void)myViewDidAppear:(BOOL)animated
{
    NSLog(@"%@--%@",self,@"myViewDidAppear");
}

@end
