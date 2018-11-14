//
//  LSCollectionVC.m
//  LighterController
//
//  Created by ejiang on 2017/2/23.
//  Copyright © 2017年 Lius. All rights reserved.
//

#import "LSCollectionVC.h"
#import "LSCollectionDataArray.h"
#import "LSCollectionViewCell.h"

@interface LSCollectionVC ()<UICollectionViewDelegate, UICollectionViewDataSourcePrefetching>

@property (nonatomic, strong) UICollectionView *collection;

@property (nonatomic, strong) NSMutableArray *itemArray;

@property (nonatomic, strong) LSCollectionDataArray *dataSource;

@end

@implementation LSCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.72 green:0 blue:0.23 alpha:1];

    for (int i = 0; i < 100; i++) {
        [self.itemArray addObject:[NSString stringWithFormat:@"%d", i]];
    }

    [self.view addSubview:self.collection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View delegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL) collectionView:(UICollectionView *)collectionView  canPerformAction:(SEL)action  forItemAtIndexPath:(NSIndexPath *)indexPath  withSender:(id)sender{
    if (action == @selector(copy:)){
        return YES;   //此处只显示copy
    }
    return NO;
}
- (void) collectionView:(UICollectionView *)collectionView  performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath  withSender:(id)sender{
    if (action == @selector(copy:)){
        LSCollectionViewCell *cell = (LSCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [[UIPasteboard generalPasteboard] setString:cell.string];    //剪贴板存储
    }
}

#pragma mark - UICollectionViewDataSourcePrefetching
- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    for (NSIndexPath *indexPath in indexPaths) {
        NSLog(@"prefetchItemsAtIndexPaths : {%ld, %ld}", (long)indexPath.section, (long)indexPath.item);
    }
}

- (void)collectionView:(UICollectionView *)collectionView cancelPrefetchingForItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    for (NSIndexPath *indexPath in indexPaths) {
        NSLog(@"cancelPrefetching : {%ld, %ld}", (long)indexPath.section, (long)indexPath.item);
    }
}

#pragma mark - getter and setter
- (UICollectionView *)collection {
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((self.view.bounds.size.width - 32) / 2.f, (self.view.bounds.size.width - 32) / 2.f);
//        layout.minimumInteritemSpacing = 10.f;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.delegate = self;
        _collection.dataSource = self.dataSource;
        _collection.prefetchDataSource = self;
//        [_collection setEdit:YES];
        [_collection registerClass:[LSCollectionViewCell class] forCellWithReuseIdentifier:@"LSCollectionViewCell"];
    }
    return _collection;
}

- (NSMutableArray *)itemArray {
    if (!_itemArray) {
        _itemArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _itemArray;
}

- (LSCollectionDataArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[LSCollectionDataArray alloc] initWithsources:self.itemArray cellIdentifier:@"LSCollectionViewCell" ConfigureItemBlock:^(LSCollectionViewCell *item, NSString * model) {
            item.string = model;
        }];
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
