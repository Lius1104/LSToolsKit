//
//  LSSBViewController.m
//  LighterController
//
//  Created by ejiang on 2017/2/21.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "LSSBViewController.h"
#import "LSTableDataSource.h"
#import "LSSBTableViewCell.h"

@interface LSSBViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong) LSTableDataSource *tableViewDataSource;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation LSSBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];

    for (int i = 0; i < 100; i++) {
        UIColor *color = [UIColor colorWithRed:(arc4random() % 255 / 255.0) green:(arc4random() % 255 / 255.0) blue:(arc4random() % 255 / 255.0) alpha:1];
        [self.dataSource addObject:color];
    }
    self.tableview.dataSource = self.tableViewDataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (LSTableDataSource *)tableViewDataSource {
    if (!_tableViewDataSource) {
        TableViewCellConfigureBlock block = ^(LSSBTableViewCell *cell, UIColor *item) {
            cell.labColor = item;
        };
        _tableViewDataSource = [[LSTableDataSource alloc] initWithItems:self.dataSource cellIdentifier:@"sbCell" configureCellBlock:block];
        [_tableViewDataSource setCellType:CellTypeForStoryboard classNameOfCell:nil];
        [_tableViewDataSource setNumberOfRows:@[@1]];
    }
    return _tableViewDataSource;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataSource;
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
