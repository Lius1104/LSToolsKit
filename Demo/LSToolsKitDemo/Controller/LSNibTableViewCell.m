//
//  LSNibTableViewCell.m
//  LighterController
//
//  Created by ejiang on 2017/2/21.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "LSNibTableViewCell.h"

@interface LSNibTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *lab;

@end

@implementation LSNibTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLabelColor:(UIColor *)labelColor {
    _lab.backgroundColor = labelColor;
    
}

@end
