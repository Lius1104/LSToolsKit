//
//  LSColorCell.m
//  LighterController
//
//  Created by ejiang on 2017/2/21.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "LSColorCell.h"

@implementation LSColorCell {
    UILabel *_lab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.accessoryType = UITableViewCellAccessoryCheckmark;
//        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkbox_off"]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _lab = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _lab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lab];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - getter and setter
//- (void)setCellColor:(UIColor *)cellColor {
//    self.contentView.backgroundColor = cellColor;
//    _lab.backgroundColor = cellColor;
//}
- (void)setString:(NSString *)string {
    _lab.text = string;
}

@end
