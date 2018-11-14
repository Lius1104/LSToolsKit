//
//  LSCollectionViewCell.m
//  LighterController
//
//  Created by ejiang on 2017/2/23.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "LSCollectionViewCell.h"

@interface LSCollectionViewCell ()

@property (nonatomic, strong) UILabel *lab;

@end

@implementation LSCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _lab = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _lab.textAlignment = NSTextAlignmentCenter;
        _lab.layer.borderWidth = 0.5;
        _lab.layer.borderColor = [UIColor blackColor].CGColor;
        [self.contentView addSubview:_lab];
    }
    return self;
}

- (void)setString:(NSString *)string {
    _string = string;
    self.lab.text = string;
}

@end
