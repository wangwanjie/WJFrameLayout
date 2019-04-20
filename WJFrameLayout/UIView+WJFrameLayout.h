//
//  UIView+WJFrameLayout.h
//  customer
//
//  Created by VanJay on 2019/4/20.
//  Copyright © 2019 chaos network technology. All rights reserved.
//

#import "WJFrameLayoutMaker.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WJFrameLayout)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGSize size;

- (void)wj_makeFrameLayout:(void (^)(WJFrameLayoutMaker *make))block;

/**
 移除所有子控件
 */
- (void)removeAllSubviews;

/**
 获取所在控制器
 */
- (UIViewController *)viewController;

/**
 设置圆角
 
 @param corners 圆角位置
 @param radius 圆角半径
 */
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 设置圆角和边框
 
 @param corners 圆角位置
 @param radius 圆角半径
 @param borderWidth 边框大小
 @param borderColor 边框颜色
 */
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end

NS_ASSUME_NONNULL_END
