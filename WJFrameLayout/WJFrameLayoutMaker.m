
//
//  WJFrameLayoutMaker.m
//  customer
//
//  Created by VanJay on 2019/4/20.
//  Copyright © 2019 chaos network technology. All rights reserved.
//

#import "WJFrameLayoutMaker.h"
#import "CALayer+WJFrameLayout.h"
#import "UIView+WJFrameLayout.h"
#import "WJFrameLayoutUtils.h"

typedef NS_ENUM(NSInteger, WJFrameLayoutMakerType) {
    WJFrameLayoutMakerTypeHorizontal = 0,
    WJFrameLayoutMakerTypeVertical,
    WJFrameLayoutMakerTypeOrigin,
    WJFrameLayoutMakerTypeSize,
    WJFrameLayoutMakerTypeCenter
};

static NSString *const kWJFrameLayoutKeyDefault = @"kWJFrameLayoutKeyDefault";
static NSString *const kWJFrameLayoutKeyWidth = @"kWJFrameLayoutKeyWidth";
static NSString *const kWJFrameLayoutKeyHeight = @"kWJFrameLayoutKeyHeight";
static NSString *const kWJFrameLayoutKeyLeft = @"kWJFrameLayoutKeyLeft";
static NSString *const kWJFrameLayoutKeyRight = @"kWJFrameLayoutKeyRight";
static NSString *const kWJFrameLayoutKeyTop = @"kWJFrameLayoutKeyTop";
static NSString *const kWJFrameLayoutKeyBottom = @"kWJFrameLayoutKeyBottom";
static NSString *const kWJFrameLayoutKeyCenterX = @"kWJFrameLayoutKeyCenterX";
static NSString *const kWJFrameLayoutKeyCenterY = @"kWJFrameLayoutKeyCenterY";
static NSString *const kWJFrameLayoutKeyOrigin = @"kWJFrameLayoutKeyOrigin";
static NSString *const kWJFrameLayoutKeySize = @"kWJFrameLayoutKeySize";
static NSString *const kWJFrameLayoutKeyCenter = @"kWJFrameLayoutKeyCenter";

@interface WJFrameLayoutMaker ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, copy) NSString *key;

@property (nonatomic, assign) WJFrameLayoutMakerType type;
@property (nonatomic, strong) NSMutableDictionary *layoutHorizontal;
@property (nonatomic, strong) NSMutableDictionary *layoutVertical;

@property (nonatomic, assign) CGFloat frameWidth;
@property (nonatomic, assign) CGFloat frameHeight;
@property (nonatomic, assign) CGFloat frameLeft;
@property (nonatomic, assign) CGFloat frameRight;
@property (nonatomic, assign) CGFloat frameTop;
@property (nonatomic, assign) CGFloat frameBottom;
@property (nonatomic, assign) CGFloat frameCenterX;
@property (nonatomic, assign) CGFloat frameCenterY;
@property (nonatomic, assign) CGPoint frameOrigin;
@property (nonatomic, assign) CGSize frameSize;

@end

@implementation WJFrameLayoutMaker
- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        self.view = view;
        [self setup];
    }
    return self;
}

- (instancetype)initWithLayer:(CALayer *)layer {
    self = [super init];
    if (self) {
        self.layer = layer;
        [self setup];
    }
    return self;
}

- (void)setup {

    self.key = kWJFrameLayoutKeyDefault;

    self.frameWidth = -0.1f;
    self.frameHeight = -0.1f;

    self.frameCenterX = -0.1f;
    self.frameCenterY = -0.1f;

    self.layoutHorizontal = [[NSMutableDictionary alloc] initWithCapacity:0];
    self.layoutVertical = [[NSMutableDictionary alloc] initWithCapacity:0];
}

- (WJFrameLayoutMaker *)width {
    self.key = kWJFrameLayoutKeyWidth;
    self.type = WJFrameLayoutMakerTypeHorizontal;
    return self;
}

- (WJFrameLayoutMaker *)height {
    self.key = kWJFrameLayoutKeyHeight;
    self.type = WJFrameLayoutMakerTypeVertical;
    return self;
}

- (WJFrameLayoutMaker *)left {
    self.key = kWJFrameLayoutKeyLeft;
    self.type = WJFrameLayoutMakerTypeHorizontal;
    return self;
}

- (WJFrameLayoutMaker *)right {
    self.key = kWJFrameLayoutKeyRight;
    self.type = WJFrameLayoutMakerTypeHorizontal;
    return self;
}

- (WJFrameLayoutMaker *)top {
    self.key = kWJFrameLayoutKeyTop;
    self.type = WJFrameLayoutMakerTypeVertical;
    return self;
}

- (WJFrameLayoutMaker *)bottom {
    self.key = kWJFrameLayoutKeyBottom;
    self.type = WJFrameLayoutMakerTypeVertical;
    return self;
}

- (WJFrameLayoutMaker *)centerX {
    self.key = kWJFrameLayoutKeyCenterX;
    self.type = WJFrameLayoutMakerTypeHorizontal;
    return self;
}

- (WJFrameLayoutMaker *)centerY {
    self.key = kWJFrameLayoutKeyCenterY;
    self.type = WJFrameLayoutMakerTypeVertical;
    return self;
}

- (WJFrameLayoutMaker *)origin {
    self.key = kWJFrameLayoutKeyOrigin;
    self.type = WJFrameLayoutMakerTypeOrigin;
    return self;
}

- (WJFrameLayoutMaker *)size {
    self.key = kWJFrameLayoutKeySize;
    self.type = WJFrameLayoutMakerTypeSize;
    return self;
}

- (WJFrameLayoutMaker *)center {
    self.key = kWJFrameLayoutKeyCenter;
    self.type = WJFrameLayoutMakerTypeCenter;
    return self;
}

- (WJFrameLayoutMaker * (^)(id to))equalTo {
    return [self wj_equalTo];
}

- (WJFrameLayoutMaker * (^)(id to))wj_equalTo {
    return ^id(id value) {
        switch (self.type) {
            case WJFrameLayoutMakerTypeHorizontal:
                [self.layoutHorizontal setValue:value forKey:self.key];
                break;
            case WJFrameLayoutMakerTypeVertical:
                [self.layoutVertical setValue:value forKey:self.key];
                break;
            case WJFrameLayoutMakerTypeOrigin: {
                NSValue *pointValue = WJBox(value);
                CGPoint point = pointValue.CGPointValue;
                [self.layoutHorizontal setValue:@(point.x) forKey:kWJFrameLayoutKeyLeft];
                [self.layoutVertical setValue:@(point.y) forKey:kWJFrameLayoutKeyTop];
                break;
            }
            case WJFrameLayoutMakerTypeSize: {
                NSValue *sizeValue = WJBox(value);
                CGSize size = sizeValue.CGSizeValue;
                [self.layoutHorizontal setValue:@(size.width) forKey:kWJFrameLayoutKeyWidth];
                [self.layoutVertical setValue:@(size.height) forKey:kWJFrameLayoutKeyHeight];
                break;
            }
            case WJFrameLayoutMakerTypeCenter: {
                NSValue *pointValue = WJBox(value);
                CGPoint point = pointValue.CGPointValue;
                [self.layoutHorizontal setValue:@(point.x) forKey:kWJFrameLayoutKeyCenterX];
                [self.layoutVertical setValue:@(point.y) forKey:kWJFrameLayoutKeyCenterY];
                break;
            }
            default:
                break;
        }

        return self;
    };
}

- (WJFrameLayoutMaker * (^)(CGFloat))valueEqualTo {
    return ^id(CGFloat value) {
        switch (self.type) {
            case WJFrameLayoutMakerTypeHorizontal:
                [self.layoutHorizontal setValue:@(value) forKey:self.key];
                break;
            case WJFrameLayoutMakerTypeVertical:
                [self.layoutVertical setValue:@(value) forKey:self.key];
                break;
            default:
                break;
        }

        return self;
    };
}

- (WJFrameLayoutMaker * (^)(CGPoint to))originEqualTo {
    return ^id(CGPoint value) {
        [self.layoutHorizontal setValue:@(value.x) forKey:kWJFrameLayoutKeyLeft];
        [self.layoutVertical setValue:@(value.y) forKey:kWJFrameLayoutKeyTop];
        return self;
    };
}

- (WJFrameLayoutMaker * (^)(CGSize to))sizeEqualTo {
    return ^id(CGSize value) {
        [self.layoutHorizontal setValue:@(value.width) forKey:kWJFrameLayoutKeyWidth];
        [self.layoutVertical setValue:@(value.height) forKey:kWJFrameLayoutKeyHeight];
        return self;
    };
}

- (WJFrameLayoutMaker * (^)(CGPoint to))centerEqualTo {
    return ^id(CGPoint value) {
        [self.layoutHorizontal setValue:@(value.x) forKey:kWJFrameLayoutKeyCenterX];
        [self.layoutVertical setValue:@(value.y) forKey:kWJFrameLayoutKeyCenterY];
        return self;
    };
}

- (WJFrameLayoutMaker * (^)(CGFloat offset))offset {
    return [self wj_offset];
}

- (WJFrameLayoutMaker *_Nonnull (^)(CGFloat))wj_offset {
    return ^id(CGFloat offset) {
        NSMutableDictionary *tempDictionary;

        switch (self.type) {
            case WJFrameLayoutMakerTypeHorizontal:
                tempDictionary = self.layoutHorizontal;
                break;
            case WJFrameLayoutMakerTypeVertical:
                tempDictionary = self.layoutVertical;
                break;
            default:
                break;
        }

        if (self.type == WJFrameLayoutMakerTypeHorizontal || self.type == WJFrameLayoutMakerTypeVertical) {
            CGFloat value = [[tempDictionary objectForKey:self.key] floatValue] + offset;
            [tempDictionary setValue:@(value) forKey:self.key];
        }
        return self;
    };
}

- (void)render {

    [self.view sizeToFit];

    id left = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyLeft];
    id right = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyRight];
    id width = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyWidth];
    id centerX = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyCenterX];

    id top = [self.layoutVertical objectForKey:kWJFrameLayoutKeyTop];
    id bottom = [self.layoutVertical objectForKey:kWJFrameLayoutKeyBottom];
    id height = [self.layoutVertical objectForKey:kWJFrameLayoutKeyHeight];
    id centerY = [self.layoutVertical objectForKey:kWJFrameLayoutKeyCenterY];

    if (left) {
        self.frameLeft = [left floatValue];

        if (width) {
            self.frameWidth = [width floatValue];
        } else if (right) {
            self.frameWidth = [right floatValue] - [left floatValue];
        } else {
        }
    } else if (width) {
        self.frameWidth = [width floatValue];

        if (right) {
            self.frameLeft = [right floatValue] - [width floatValue];
        } else {
        }

    } else if (right) {
        self.frameLeft = [right floatValue] - self.view.width;
    }

    if (top) {
        self.frameTop = [top floatValue];
        if (height) {
            self.frameHeight = [height floatValue];
        } else if (bottom) {
            self.frameHeight = [bottom floatValue] - [top floatValue];
        } else {
        }
    } else if (height) {
        self.frameHeight = [height floatValue];

        if (bottom) {
            self.frameTop = [bottom floatValue] - [height floatValue];
        } else {
        }

    } else if (bottom) {
        self.frameTop = [bottom floatValue] - self.view.height;
    }

    self.view.frame = CGRectMake(self.frameLeft,
                                 self.frameTop,
                                 self.frameWidth > 0 ? self.frameWidth : self.view.width,
                                 self.frameHeight > 0 ? self.frameHeight : self.view.height);

    if (centerX) {
        self.view.centerX = [centerX floatValue];
    }

    if (centerY) {
        self.view.centerY = [centerY floatValue];
    }
}

- (void)renderLayerFrame {

    id left = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyLeft];
    id right = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyRight];
    id width = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyWidth];
    id centerX = [self.layoutHorizontal objectForKey:kWJFrameLayoutKeyCenterX];

    id top = [self.layoutVertical objectForKey:kWJFrameLayoutKeyTop];
    id bottom = [self.layoutVertical objectForKey:kWJFrameLayoutKeyBottom];
    id height = [self.layoutVertical objectForKey:kWJFrameLayoutKeyHeight];
    id centerY = [self.layoutVertical objectForKey:kWJFrameLayoutKeyCenterY];

    if (left) {
        self.frameLeft = [left floatValue];

        if (width) {
            self.frameWidth = [width floatValue];
        } else if (right) {
            self.frameWidth = [right floatValue] - [left floatValue];
        } else {
        }
    } else if (width) {
        self.frameWidth = [width floatValue];

        if (right) {
            self.frameLeft = [right floatValue] - [width floatValue];
        } else {
        }

    } else if (right) {
        self.frameLeft = [right floatValue] - self.layer.wj_width;
    }

    if (top) {
        self.frameTop = [top floatValue];
        if (height) {
            self.frameHeight = [height floatValue];
        } else if (bottom) {
            self.frameHeight = [bottom floatValue] - [top floatValue];
        } else {
        }
    } else if (height) {
        self.frameHeight = [height floatValue];

        if (bottom) {
            self.frameTop = [bottom floatValue] - [height floatValue];
        } else {
        }

    } else if (bottom) {
        self.frameTop = [bottom floatValue] - self.layer.wj_height;
    }

    self.layer.frame = CGRectMake(self.frameLeft,
                                  self.frameTop,
                                  self.frameWidth > 0 ? self.frameWidth : self.layer.wj_width,
                                  self.frameHeight > 0 ? self.frameHeight : self.layer.wj_height);

    if (centerX) {
        self.layer.wj_centerX = [centerX floatValue];
    }

    if (centerY) {
        self.layer.wj_centerY = [centerY floatValue];
    }
}
@end
