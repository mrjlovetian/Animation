//
//  ViewController.m
//  Animation
//
//  Created by Mr on 2017/11/24.
//  Copyright © 2017年 Mr. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"
#import "MaxViewController.h"
#import "DrawingViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIView *layerView;
@property (nonatomic, strong)CALayer *colorLayer;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ScrollView *view = [[ScrollView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
//    view.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:self.layerView];
//    self.colorLayer.frame = self.layerView.bounds;
//    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
//
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromLeft;
//    self.colorLayer.actions = @{@"backgroundColor":transition};
//    [self.view.layer addSublayer:self.colorLayer];
//
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 320, 60, 60);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)clickBtn {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INTMAX_MAX;
    CGFloat blue = arc4random() / (CGFloat)INTMAX_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
}

- (void)changeColor {
    DrawingViewController *darwingVC = [[DrawingViewController alloc] init];
    [self presentViewController:darwingVC animated:YES completion:nil];
    
    return;
    MaxViewController *maxVC = [[MaxViewController alloc] init];
    [self presentViewController:maxVC animated:YES completion:nil];
    
    return;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[(__bridge id)[UIColor blueColor].CGColor, (__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor greenColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
        _layerView.backgroundColor = [UIColor orangeColor];
    }
    return _layerView;
}

- (CALayer *)colorLayer {
    if (!_colorLayer) {
        _colorLayer = [CALayer layer];
    }
    return _colorLayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        [self clickBtn];
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
