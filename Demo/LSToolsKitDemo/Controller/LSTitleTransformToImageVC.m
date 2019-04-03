//
//  LSTitleTransformToImageVC.m
//  LSToolsKitDemo
//
//  Created by 刘爽 on 2019/4/3.
//  Copyright © 2019 刘爽. All rights reserved.
//

#import "LSTitleTransformToImageVC.h"
#import "LSToolsKit.h"

@interface LSTitleTransformToImageVC ()

@end

@implementation LSTitleTransformToImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString * title = [NSString stringWithFormat:@"已审阅 0.0"];
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary * attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName : [UIColor whiteColor], NSParagraphStyleAttributeName : style};
    CGSize  size = [title boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    size.height = 16;
    size.width = ceil(8 + size.width);
    UIImage * reviewImg = [UIImage imageFromString:title attributes:attributes size:size backgroundColor:[UIColor blackColor]];
    UIImageView * imgView = [[UIImageView alloc] initWithImage:reviewImg];
    [self.view addSubview:imgView];
    CGRect frame = imgView.frame;
    frame.origin.x = 100;
    frame.origin.y = 100;
    imgView.frame = frame;
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
