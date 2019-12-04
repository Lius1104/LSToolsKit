//
//  SaveToAlbumExampleVC.m
//  LSToolsKitDemo
//
//  Created by LiuShuang on 2019/9/18.
//  Copyright © 2019 刘爽. All rights reserved.
//

#import "SaveToAlbumExampleVC.h"
#import "LSSaveToAlbum.h"
#import "UIImage+LSAdd.h"

@interface SaveToAlbumExampleVC ()

@end

@implementation SaveToAlbumExampleVC

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)handleClickSaveButton:(UIButton *)sender {
    UIColor * color = randomColor;
    sender.backgroundColor = color;
    UIImage * image = [self imageWithColor:color size:CGSizeMake(900, 900)];
//    [[LSSaveToAlbum mainSave] saveImage:image successBlock:^(NSString *assetLocalId) {
//        NSLog(@"%@", assetLocalId);
//    } failureBlock:^(NSError *error) {
//        NSLog(@"%@", error);
//        if (error.domain == NSCocoaErrorDomain && error.code == 2047) {
//            
//        }
//    }];
    [[LSSaveToAlbum mainSave] saveImage:image successBlock:nil failureBlock:nil];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
