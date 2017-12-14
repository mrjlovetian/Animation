//
//  ScrollView.m
//  Animation
//
//  Created by Mr on 2017/12/8.
//  Copyright © 2017年 Mr. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

+ (Class)layerClass {
    return [CAScrollLayer class];
}

- (void)setUp {
    self.layer.masksToBounds = YES;
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:tap];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint point = self.bounds.origin;
    point.x -= [pan translationInView:self].x;
    point.y -= [pan translationInView:self].y;
    
    [(CAScrollLayer *)self.layer scrollToPoint:point];
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    [pan setTranslation:CGPointZero inView:self];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
