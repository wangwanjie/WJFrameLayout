//
//  CALayer+WJFrameLayout.m
//  ViPay
//
//  Created by VanJay on 2019/10/30.
//  Copyright © 2019 chaos network technology. All rights reserved.
//

#import "CALayer+WJFrameLayout.h"

@implementation CALayer (WJFrameLayout)

- (CGFloat)wj_left {
    return self.frame.origin.x;
}

- (void)setWj_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)wj_top {
    return self.frame.origin.y;
}

- (void)setWj_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)wj_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setWj_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)wj_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setWj_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)wj_centerX {
    return self.position.x;
}

- (void)setWj_centerX:(CGFloat)centerX {
    self.position = CGPointMake(centerX, self.position.y);
}

- (CGFloat)wj_centerY {
    return self.position.y;
}

- (void)setWj_centerY:(CGFloat)centerY {
    self.position = CGPointMake(self.position.x, centerY);
}

- (CGFloat)wj_width {
    return self.frame.size.width;
}

- (void)setWj_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)wj_height {
    return self.frame.size.height;
}

- (void)setWj_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)wj_origin {
    return self.frame.origin;
}

- (void)setWj_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)wj_size {
    return self.frame.size;
}

- (void)setWj_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)wj_makeFrameLayout:(void (^)(WJFrameLayoutMaker *make))block {

    WJFrameLayoutMaker *make = [[WJFrameLayoutMaker alloc] initWithLayer:self];
    block(make);
    [make renderLayerFrame];
}
@end
