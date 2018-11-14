//
//  FontAdaptViewController.m
//  LSKitDemo
//
//  Created by Lius on 2017/5/26.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "FontAdaptViewController.h"
#import "LSKit.h"

@interface FontAdaptViewController ()

@property (nonatomic, strong) UIButton *fontBtn;

@property (nonatomic, strong) UILabel *fontLab;

@property (nonatomic, strong) UITextView *fontTV;

@property (nonatomic, strong) UITextField *fontTF;

@end

@implementation FontAdaptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.fontBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
//    self.fontBtn.titleLabel.font = [LSFont systemFontOfSize:16];
    self.fontBtn.titleLabel.font = [UIFont ls_fontWithName:@"DFPShaoNvW5" size:16];
    [self.fontBtn setTitle:@"按钮——字号自适应" forState:UIControlStateNormal];
    [self.fontBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:self.fontBtn];

    self.fontLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_fontBtn.frame), self.view.bounds.size.width, 50)];
    self.fontLab.textAlignment = NSTextAlignmentCenter;
//    self.fontLab.font = [LSFont systemFontOfSize:16];
    self.fontLab.font = [UIFont ls_fontWithName:@"DFPShaoNvW5" size:16];
    self.fontLab.text = @"标题——字号自适应";
    [self.view addSubview:self.fontLab];

    self.fontTV = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_fontLab.frame), self.view.bounds.size.width, 25)];
    self.fontTV.font = [UIFont ls_systemFontOfSize:16];
    self.fontTV.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.fontTV];

    self.fontTF = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_fontTV.frame) + 20, self.view.bounds.size.width, 50)];
    self.fontTF.font = [UIFont ls_systemFontOfSize:16];
    self.fontTF.backgroundColor = [UIColor orangeColor];
    self.fontTF.placeholder = @"输入框——字号自适应";
    [self.view addSubview:self.fontTF];

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
