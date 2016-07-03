//
//  DemoFourCollectionViewController.m
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import "DemoFourCollectionViewController.h"
#import "CBTableViewDataSource/UITableView+CBTableViewDataSource.h"
#import "DemoTwoViewController.h"
#import "DemoTwoViewModel.h"
#import "UINavigationBar+Awesome.h"
#import "UICollectionView+CBTableViewDataSource.h"
#import "FeedCollectionViewCell.h"
#import "CBTableViewDataSource/CBTableViewDataSource.h"
#import "DemoFourViewModel.h"

@implementation DemoFourCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self.navigationController.navigationBar lt_setBackgroundColor: [UIColor colorWithRed:0.27 green:0.75 blue:0.78 alpha:1.00]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    __weak typeof(self) weakSelf = self;
    self.viewModel.dataUpdate = ^(){
        [weakSelf.collectionView reloadData];
    };
    
    [self.viewModel fetchData];
}

- (UICollectionView *)collectionView {
    if(!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
        
        [_collectionView cb_makeDataSource:^(CBTableViewDataSourceMaker * make) {
            [make makeSection:^(CBTableViewSectionMaker *section) {
                section.cell([FeedCollectionViewCell class])
                .data(self.viewModel.feed)
                .adapter(^(FeedCollectionViewCell * cell,NSDictionary * data,NSUInteger index){
                    [cell.avatarView setImage:[UIImage imageNamed:data[@"avatar"]]];
                    [cell.nameView setText:data[@"user"]];
                    [cell.dateView setText:data[@"date"]];
                    [cell.detailView setText:data[@"content"]];
                    [cell.imgView setImage:[UIImage imageNamed:data[@"image"]]];
                });
                section.autoHeight();
//                .size(CGSizeMake(SCREEN_WIDTH, 300));
            }];
        }];
        
        
    }
    return _collectionView;
}

- (DemoFourViewModel *)viewModel {
    if(!_viewModel) {
        _viewModel = [[DemoFourViewModel alloc] init];
    }
    return _viewModel;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
