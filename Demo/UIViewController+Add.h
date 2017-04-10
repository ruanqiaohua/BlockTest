//
//  UIViewController+Add.h
//  Demo
//
//  Created by 阮巧华 on 2017/4/10.
//  Copyright © 2017年 阮巧华. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

@interface UIViewController (Add)

@end
