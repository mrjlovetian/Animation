//
//  DrawingViewController.m
//  Animation
//
//  Created by Mr on 2017/12/14.
//  Copyright © 2017年 Mr. All rights reserved.
//

#import "DrawingViewController.h"
#import "DrawingView.h"

@interface DrawingViewController ()

@property (nonatomic, strong) DrawingView *drawingView;

@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.drawingView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI

- (DrawingView *)drawingView {
    if (!_drawingView) {
        _drawingView = [[DrawingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _drawingView.backgroundColor = [UIColor whiteColor];
    }
    return _drawingView;
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
