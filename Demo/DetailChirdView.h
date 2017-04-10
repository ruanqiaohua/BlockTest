//
//  DetailChirdView.h
//  Demo
//
//  Created by 阮巧华 on 2017/4/10.
//  Copyright © 2017年 阮巧华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchBeginCb)();

@interface DetailChirdView : UIView

@property (nonatomic, copy) TouchBeginCb touchBeginCb;

- (void)backgroundDidTap:(TouchBeginCb)cb;

@end
