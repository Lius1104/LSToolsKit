//
//  ExpendClickButtonVC.m
//  LSKitDemo
//
//  Created by Lius on 2017/5/8.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "ExpendClickButtonVC.h"
#import "LSButton.h"
#import "UIButton+LSAdd.h"
#import "LSKit.h"

@interface ExpendClickButtonVC ()

@end

@implementation ExpendClickButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LSButton *btn = [[LSButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.center = CGPointMake(self.view.bounds.size.width / 2.f, self.view.bounds.size.height / 2.f);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(handleTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSLog(@"%f", btn.ls_cornerRadius);
    btn.ls_cornerRadius = 20;

//    btn.expendX = 50;
//    btn.expendDirection = ExpandingDirectionRight;
    btn.expendX = 50;
    btn.expendY = 50;
    btn.expendDirection = ExpandingDirectionAll;

    ExpandingDirectionType type = ExpandingDirectionTop | ExpandingDirectionBottom | ExpandingDirectionRight | ExpandingDirectionLeft;
    NSLog(@"%lu", (unsigned long)ExpandingDirectionTop);
    NSLog(@"%lu", (unsigned long)ExpandingDirectionBottom);
    NSLog(@"%lu", (unsigned long)ExpandingDirectionRight);
    NSLog(@"%lu", (unsigned long)ExpandingDirectionLeft);
    NSLog(@"%lu", (unsigned long)ExpandingDirectionAll);
    NSLog(@"%lu", (unsigned long)type);


    CGRect bounds = CGRectMake(0, 0, btn.bounds.size.width, btn.bounds.size.height);

    //expendX,expendY 是希望的X 轴或者Y轴方向的点击区域的宽度或者高度
    CGFloat widthDelta = btn.expendX;
    CGFloat heightDelta = btn.expendY;

    if (btn.expendDirection & ExpandingDirectionTop) {
        //向上扩展
        NSLog(@"向上扩展");
        bounds.origin.y = - (heightDelta / 2.f);
    }
    if (btn.expendDirection & ExpandingDirectionBottom) {
        //向下扩展
        NSLog(@"向下扩展");
        if (bounds.origin.y < 0) {
            bounds.size.height += btn.expendY;
        } else {
            bounds.origin.y = (heightDelta / 2.f);
        }
    }
    if (btn.expendDirection & ExpandingDirectionLeft) {
        //向左扩展
        NSLog(@"向左扩展");
        bounds.origin.x = - (widthDelta / 2.f);
    }
    if (btn.expendDirection & ExpandingDirectionRight) {
        //向右扩展
        NSLog(@"向右扩展");
        if (bounds.origin.x < 0) {
            bounds.size.width += btn.expendX;
        } else {
            bounds.origin.x = (widthDelta / 2.f);
        }
    }

    bounds = CGRectInset(bounds, - 0.5 * widthDelta, - 0.5 * heightDelta);
    CALayer *layer = [CALayer layer];
    //2.设置layer的属性(一定要设置位置，颜色属性才能显示出来)
    layer.backgroundColor = [UIColor brownColor].CGColor;
    layer.frame = bounds;
    //    layer.position = CGPointMake(100, 100);
    //3.把layer添加到界面上
    [btn.layer addSublayer:layer];

//    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    subView.backgroundColor = [UIColor redColor];
//    [btn addSubview:subView];
    btn.ls_timeInterVal = 2.f;
    NSLog(@"%f", btn.ls_cornerRadius);
    
    UIView * bottomView = [[UIView alloc] initWithFrame:btn.frame];
    bottomView.backgroundColor = [UIColor redColor];
    bottomView.ls_cornerRadius = 30;
    [self.view addSubview:bottomView];
    
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:btn.frame];
    imgView.backgroundColor = [UIColor whiteColor];
    imgView.ls_cornerRadius = 50;
    [self.view addSubview:imgView];
}

- (void)handleTouchUpInside {
    NSLog(@"点击button");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
