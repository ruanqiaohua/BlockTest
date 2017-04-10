//
//  DetailViewController.m
//  Demo
//
//  Created by 阮巧华 on 2017/4/10.
//  Copyright © 2017年 阮巧华. All rights reserved.
//

#import "DetailViewController.h"
#import "UIViewController+Add.h"
#import "ShareManager.h"
#import "DetailChirdView.h"

@interface DetailViewController ()

@property (nonatomic, copy) void (^testBlock)();
@property (nonatomic, strong) DetailChirdView *chirdView;

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    @WeakObj(self);
    // _testBlock相当于self.testBlock
    _testBlock = ^() {
        selfWeak.view.backgroundColor = [UIColor yellowColor];
    };
    // 单例不会导致循环引用，但是有延迟的话会导致dealloc不能及时调用
    [[ShareManager inst] hello:^{
        selfWeak.detailDescriptionLabel.text = @"hi";
    }];
    
    self.chirdView = [[DetailChirdView alloc] initWithFrame:self.view.bounds];
    self.chirdView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.chirdView];
    // 方法名不会导致循环引用，但是有延迟的话会导致dealloc不能及时调用
    [self.chirdView backgroundDidTap:^{
        selfWeak.view.backgroundColor = [UIColor yellowColor];
        selfWeak.chirdView.backgroundColor = [UIColor blackColor];
    }];
    // 属性Xcode就会提示循环引用，所以要用weak
    self.chirdView.touchBeginCb = ^{
        selfWeak.view.backgroundColor = [UIColor yellowColor];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDate *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
