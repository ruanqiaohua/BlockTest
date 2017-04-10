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
