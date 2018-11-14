//
//  LSSBTableViewCell.m
//  LighterController
//
//  Created by ejiang on 2017/2/21.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "LSSBTableViewCell.h"

@interface LSSBTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *label;


@end

@implementation LSSBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLabColor:(UIColor *)labColor {
    self.label.backgroundColor = labColor;
}

@end
