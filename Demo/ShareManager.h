//
//  ShareManager.h
//  Demo
//
//  Created by 阮巧华 on 2017/4/10.
//  Copyright © 2017年 阮巧华. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^helloCb)();

@interface ShareManager : NSObject

+ (instancetype)inst;

- (void)hello:(helloCb)cb;

@end
