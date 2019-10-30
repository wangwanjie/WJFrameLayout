//
//  CALayer+WJFrameLayout.h
//  ViPay
//
//  Created by VanJay on 2019/10/30.
//  Copyright © 2019 chaos network technology. All rights reserved.
//

#import "WJFrameLayoutMaker.h"
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (WJFrameLayout)
@property (nonatomic, assign) CGFloat wj_left;
@property (nonatomic, assign) CGFloat wj_right;
@property (nonatomic, assign) CGFloat wj_top;
@property (nonatomic, assign) CGFloat wj_bottom;
@property (nonatomic, assign) CGFloat wj_centerX;
@property (nonatomic, assign) CGFloat wj_centerY;
@property (nonatomic, assign) CGPoint wj_origin;
@property (nonatomic, assign) CGFloat wj_width;
@property (nonatomic, assign) CGFloat wj_height;
@property (nonatomic, assign) CGSize wj_size;

- (void)wj_makeFrameLayout:(void (^)(WJFrameLayoutMaker *make))block;
@end

NS_ASSUME_NONNULL_END
