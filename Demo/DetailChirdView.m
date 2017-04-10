//
//  DetailChirdView.m
//  Demo
//
//  Created by 阮巧华 on 2017/4/10.
//  Copyright © 2017年 阮巧华. All rights reserved.
//

#import "DetailChirdView.h"

@interface DetailChirdView ()

@end

@implementation DetailChirdView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"block" forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2);
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)btnAction:(UIButton *)sender {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.touchBeginCb) {
            self.touchBeginCb();
        }
    });
}

- (void)backgroundDidTap:(TouchBeginCb)cb {
    
    if (cb) {
        self.touchBeginCb = cb;
    }
}

@end
