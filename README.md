# WJFrameLayout

基于 [Hotpot](https://github.com/hellometers/Hotpot.git) 改造，支持设置 size、center、origin 等，借鉴 [Masonry](https://github.com/SnapKit/Masonry)，传值可以不用包装成 NSValue 就让一个方法通用

An iOS layout framework based on Frame layout. The way using it is like Masonry.

[![CI Status](https://img.shields.io/travis/wangwanjie/WJFrameLayout.svg?style=flat)](https://travis-ci.org/wangwanjie/WJFrameLayout)
[![Version](https://img.shields.io/cocoapods/v/WJFrameLayout.svg?style=flat)](https://cocoapods.org/pods/WJFrameLayout)
[![License](https://img.shields.io/cocoapods/l/WJFrameLayout.svg?style=flat)](https://cocoapods.org/pods/WJFrameLayout)
[![Platform](https://img.shields.io/cocoapods/p/WJFrameLayout.svg?style=flat)](https://cocoapods.org/pods/WJFrameLayout)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
ARC, iOS 6 or above, XCode 5 or above

## Installation

WJFrameLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WJFrameLayout'
```

## Use

```
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
```

## Author

wangwanjie, wangwanjie1993@gmail.com

## License

WJFrameLayout is available under the MIT license. See the LICENSE file for more info.
