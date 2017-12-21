//
//  UIViewController+SwizzleMethod.h
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SwizzleMethod)

- (void)myViewWillAppear:(BOOL)animated;

- (void)myViewDidAppear:(BOOL)animated;
@end
