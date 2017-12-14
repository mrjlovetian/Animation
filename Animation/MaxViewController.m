//
//  MaxViewController.m
//  Animation
//
//  Created by Mr on 2017/12/8.
//  Copyright © 2017年 Mr. All rights reserved.
//

#import "MaxViewController.h"

@interface MaxViewController () <CALayerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    
    [self addLayer];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CALayerDelegate

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    layer.contentsScale = [UIScreen mainScreen].scale;
    NSLog(@"bounds.origin.x = %f,bounds.origin.y =  %f -==-=-=%f", bounds.origin.x, bounds.origin.y, layer.tileSize.width);
    NSInteger x = floor(bounds.origin.x/layer.tileSize.width*[UIScreen mainScreen].scale);
    NSInteger y = floor(bounds.origin.y/layer.tileSize.height*[UIScreen mainScreen].scale);
    NSString *imageName = [NSString stringWithFormat:@"tileImage/404488_%02i_%02i", x, y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    UIGraphicsPushContext(ctx);
    [image drawInRect:bounds];
    UIGraphicsPopContext();
}

#pragma mark METHOE

- (void)addLayer {
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
    [self.scrollView.layer addSublayer:tileLayer];
    self.scrollView.contentSize = tileLayer.frame.size;
    [tileLayer setNeedsDisplay];
}

#pragma mark UI

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
        _scrollView.center = self.view.center;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
