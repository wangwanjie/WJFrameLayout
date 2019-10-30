//
//  WJFrameLayoutMaker.h
//  customer
//
//  Created by VanJay on 2019/4/20.
//  Copyright © 2019 chaos network technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJFrameLayoutMaker : NSObject

- (instancetype)initWithView:(UIView *)view;
- (instancetype)initWithLayer:(CALayer *)layer;

/**
 使用此方法参数需包装成 NSValue，使用 @(value) 或者 [NSValue valueWith:xxx] 麻烦，请使用 equalToValue 方法
 */
- (WJFrameLayoutMaker * (^)(id to))equalTo;

/**
 使用此方法参数需包装成 NSValue，使用 @(value) 或者 [NSValue valueWith:xxx] 麻烦，请使用 equalToValue 方法
 */
- (WJFrameLayoutMaker * (^)(id to))wj_equalTo;

/**
 设置除 origin、origin、size 之外的属性
 */
- (WJFrameLayoutMaker * (^)(CGFloat to))valueEqualTo;

/**
 只用来设置 origin
 */
- (WJFrameLayoutMaker * (^)(CGPoint to))originEqualTo;

/**
 只用来设置 size
 */
- (WJFrameLayoutMaker * (^)(CGSize to))sizeEqualTo;

/**
  只用来设置 center
 */
- (WJFrameLayoutMaker * (^)(CGPoint to))centerEqualTo;

/**
 设置偏移，对 origin、size、center 无效
 */
- (WJFrameLayoutMaker * (^)(CGFloat offset))offset;

/**
 设置偏移，对 origin、size、center 无效
 */
- (WJFrameLayoutMaker * (^)(CGFloat offset))wj_offset;

@property (nonatomic, assign) WJFrameLayoutMaker *left;
@property (nonatomic, assign) WJFrameLayoutMaker *right;
@property (nonatomic, assign) WJFrameLayoutMaker *top;
@property (nonatomic, assign) WJFrameLayoutMaker *bottom;
@property (nonatomic, assign) WJFrameLayoutMaker *width;
@property (nonatomic, assign) WJFrameLayoutMaker *height;
@property (nonatomic, assign) WJFrameLayoutMaker *centerX;
@property (nonatomic, assign) WJFrameLayoutMaker *centerY;
@property (nonatomic, assign) WJFrameLayoutMaker *center;
@property (nonatomic, assign) WJFrameLayoutMaker *origin;
@property (nonatomic, assign) WJFrameLayoutMaker *size;

- (void)render;
- (void)renderLayerFrame;

@end

NS_ASSUME_NONNULL_END
