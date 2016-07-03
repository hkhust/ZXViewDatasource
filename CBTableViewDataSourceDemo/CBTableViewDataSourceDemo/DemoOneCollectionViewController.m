//
//  DemoOneCollectionViewController.m
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import "DemoOneCollectionViewController.h"
#import "CBTableViewDataSource/CBTableViewDataSource.h"
#import "UICollectionView+CBTableViewDataSource.h"
#import "DemoOneViewModel.h"
#import "DemoTwoViewModel.h"
#import "CustomCollectionViewCell.h"
#import "UINavigationBar+Awesome.h"

@interface DemoOneCollectionViewController ()

@end

@implementation DemoOneCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    [self.collectionView reloadData];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self.navigationController.navigationBar lt_setBackgroundColor: [UIColor colorWithRed:0.27 green:0.75 blue:0.78 alpha:1.00]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


- (UICollectionView *)collectionView {
    if(!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
        
        [_collectionView cb_makeSectionWithData:self.viewModel.data andCellClass:[CustomCollectionViewCell class]];
//        [_collectionView cb_makeDataSource:^(CBTableViewDataSourceMaker *make) {
////            [make scrollViewDidScroll:didScroll];
//            
//            [make makeSection:^(CBTableViewSectionMaker * section) {
//                section.cell([UICollectionViewCell class])
//                .data(@[self.viewModel.data])
//                .size(CGSizeMake(320, 40))
//                .adapter(^(UICollectionViewCell * cell,NSArray * data,NSUInteger index){
//                    
//                });
//            }];
//            
//        }];
//        [_collectionView cb_makeSectionWithData:self.viewModel.data];
    }
    return _collectionView;
}

- (DemoOneViewModel *)viewModel {
    if(!_viewModel) {
        _viewModel = [DemoOneViewModel new];
    }
    return _viewModel;
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
