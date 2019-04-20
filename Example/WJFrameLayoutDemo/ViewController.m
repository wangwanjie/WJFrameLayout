//
//  ViewController.m
//  WJFrameLayoutDemo
//
//  Created by VanJay on 2019/4/20.
//  Copyright © 2019 VanJay. All rights reserved.
//

#import "ViewController.h"
#import "WJFrameLayout.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) UIView *orangeView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.redView = [[UIView alloc] init];
    self.blueView = [[UIView alloc] init];
    self.blackView = [[UIView alloc] init];
    self.orangeView = [[UIView alloc] init];

    self.redView.layer.cornerRadius = 4.f;
    self.redView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.7f];
    self.redView.layer.masksToBounds = YES;
    [self.view addSubview:self.redView];

    self.blueView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8f];
    self.blueView.layer.cornerRadius = 4.f;
    self.blueView.layer.masksToBounds = YES;
    [self.view addSubview:self.blueView];

    self.blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    self.blackView.layer.cornerRadius = 4.f;
    self.blackView.layer.masksToBounds = YES;
    [self.view addSubview:self.blackView];

    self.orangeView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.8f];
    self.orangeView.layer.cornerRadius = 20.f;
    self.orangeView.layer.masksToBounds = YES;
    [self.view addSubview:self.orangeView];

    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"WJFrameLayout WJFrameLayout";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.7f];
    self.nameLabel.layer.cornerRadius = 4.f;
    self.nameLabel.layer.masksToBounds = YES;
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:18.f];
    [self.view addSubview:self.nameLabel];
}

- (void)viewDidLayoutSubviews {

    [super viewDidLayoutSubviews];

    [self.redView wj_makeFrameLayout:^(WJFrameLayoutMaker *_Nonnull make) {
        // 使用这种方式参数可以不用包装成 NSValue
        make.left.equalToValue(self.view.left).offset(20.f);
        // 使用下面这两种需要将参数包装成 NSValue 或者传 id 类型
        make.right.equalTo(@(self.view.right)).offset(-20.f);
        make.height.wj_equalTo(@(40.f));
        make.top.equalToValue(self.view.top).offset(40.f);
    }];

    [self.blueView wj_makeFrameLayout:^(WJFrameLayoutMaker *_Nonnull make) {
        make.centerX.equalToValue(self.view.centerX);
        make.bottom.equalToValue(self.view.bottom).offset(-50.f);
        // 支持设置 size
        make.size.wj_equalTo(WJBox(CGSizeMake(120.f, 88)));
        // 设置 size 也提供了下面的方法
        // make.size.sizeEqualTo(CGSizeMake(120.f, 88));
    }];

    [self.blackView wj_makeFrameLayout:^(WJFrameLayoutMaker *_Nonnull make) {
        make.height.equalToValue(100.f);
        // 支持设置 center
        make.center.equalToValue(CGPointMake(self.view.centerX, self.view.centerY));
        // 设置 center 也提供了下面的方法
        // make.center.centerEqualTo(CGPointMake(self.view.centerX, self.view.centerY));
        make.left.equalToValue(self.view.left).offset(20.f);
        make.right.equalToValue(self.blueView.left);
    }];
    
    /**
     equalTo
     wj_equalTo
     equalToValue
     这三种是等价的，只是 equalToValue 可以传值不用包装成 NSValue，像平时直接设置 frame 一样即可
     */

    [self.orangeView wj_makeFrameLayout:^(WJFrameLayoutMaker *_Nonnull make) {
        make.width.equalToValue(40.f);
        make.height.equalToValue(40.f);
        make.centerY.equalTo(@(self.blackView.bottom)).offset(40);
        make.left.equalToValue(self.blackView.right).offset(-50.f);
    }];

    [self.nameLabel wj_makeFrameLayout:^(WJFrameLayoutMaker *_Nonnull make) {
        make.bottom.equalToValue(self.blackView.top).offset(-20.f);
        make.centerX.wj_equalTo(@(self.view.centerX));
    }];
}
@end
