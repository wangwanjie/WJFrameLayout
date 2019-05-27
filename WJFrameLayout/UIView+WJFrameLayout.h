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

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

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
- (CAShapeLayer *)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 设置圆角和边框
 
 @param corners 圆角位置
 @param radius 圆角半径
 @param borderWidth 边框大小
 @param borderColor 边框颜色
 */
- (CAShapeLayer *)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 设置圆角阴影

 @param corners 圆角位置
 @param radius 圆角半径
 @param shadowRadius 阴影半径
 @param shadowOpacity 阴影透明度
 @param shadowColor 阴影颜色
 @param fillColor 填充颜色
 @param shadowOffset 阴影偏移
 @return 添加的图层
 */
- (CAShapeLayer *)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius shadowRadius:(CGFloat)shadowRadius shadowOpacity:(float)shadowOpacity shadowColor:(CGColorRef)shadowColor fillColor:(CGColorRef)fillColor shadowOffset:(CGSize)shadowOffset;
@end

NS_ASSUME_NONNULL_END
