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
@end

NS_ASSUME_NONNULL_END
