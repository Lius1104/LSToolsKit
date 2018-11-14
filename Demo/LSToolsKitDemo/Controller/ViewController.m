//
//  ViewController.m
//  LighterController
//
//  Created by ejiang on 2017/2/21.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "ViewController.h"
#import "LSTableDataSource.h"
#import "LSColorCell.h"
#import "LSSBViewController.h"
#import "LSNibTableViewCell.h"

@interface ViewController ()<UITableViewDelegate> {
//    int _index;
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) LSTableDataSource *TableDataSource;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

static NSString *const cellIdentifier = @"nibCell";//@"ColorCell"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = YES;
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    for (int i = 0; i < 10; i++) {
//        UIColor *color = [UIColor colorWithRed:(arc4random() % 255 / 255.0) green:(arc4random() % 255 / 255.0) blue:(arc4random() % 255 / 255.0) alpha:1];
//        [self.dataSource addObject:color];
        [self.dataSource addObject:[NSString stringWithFormat:@"%d", i]];
    }
    [self.view addSubview:self.tableView];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(handleJumpToNext)];
    self.navigationItem.rightBarButtonItem = item;
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleDone target:self action:@selector(refreshTableView)];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)viewWillAppear:(BOOL)animated {

}

- (void)viewDidAppear:(BOOL)animated {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    LSColorCell *cell = (LSColorCell *)[self.tableView cellForRowAtIndexPath:indexPath];
//    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
//        cell.accessoryType = UITableViewCellEditingStyleNone;
//        cell.accessoryView = nil;
//    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleInsert;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.f;
}

#pragma mark - event respond
- (void)handleJumpToNext {
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Test" bundle:nil];
//    LSSBViewController *sbVC = [sb instantiateViewControllerWithIdentifier:@"LSSBViewController"];
//    [self.navigationController pushViewController:sbVC animated:YES];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < 10; i++) {
        [self.dataSource addObject:[NSString stringWithFormat:@"%d", i]];
    }
//    [_TableDataSource incrementalUpdateDataSource:array];
//    [_TableDataSource setNumberOfRows:@[@2, @8, @6, @4]];
    [_TableDataSource updateDataSource:self.dataSource];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:3];
    [_TableDataSource setCanEditRows:@[indexSet, indexPath] typeOfInsert:InsertIntoAbove];
    [self.tableView reloadData];
}

- (void)refreshTableView {
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
//    [self.TableDataSource setCanMoveRows:nil whetherMoveInGroup:NO];
    [self.tableView reloadData];
}

#pragma mark - getter and setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self.TableDataSource;
//        [_tableView setEditing:YES animated:YES];
    }
    return _tableView;
}

- (LSTableDataSource *)TableDataSource {
    if (!_TableDataSource) {
        //代码
        TableViewCellConfigureBlock block = ^(LSColorCell *cell, NSString *item) {
            cell.string = item;
        };
        _TableDataSource = [[LSTableDataSource alloc] initWithItems:self.dataSource cellIdentifier:cellIdentifier configureCellBlock:block];
        [_TableDataSource setNumberOfRows:@[@1, @4, @3, @2]];
        [_TableDataSource setCellType:CellTypeForCode classNameOfCell:NSStringFromClass([LSColorCell class])];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:3];
//        [_TableDataSource setCanMoveRows:@[indexSet, indexPath] whetherMoveInGroup:NO];
//        [_TableDataSource setCanEditRows:@[indexSet, indexPath] typeOfInsert:InsertIntoAbove];
        [_TableDataSource setCanEditRows:nil typeOfInsert:InsertIntoAbove];
    }
    return _TableDataSource;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataSource;
}

@end
