//
//  DemoThreeCollectionViewController.m
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import "DemoThreeCollectionViewController.h"
#import "DemoThreeViewModel.h"
#import "HomeActivityCollectionViewCell.h"
#import "GoodsCollectionViewCell.h"
#import "UINavigationBar+Awesome.h"
#import "UICollectionView+CBTableViewDataSource.h"
#import "CBTableViewDataSource/CBTableViewDataSource.h"
#import "CycleScrollCollectionViewCell.h"
#import "CategoryCollectionViewCell.h"

@implementation DemoThreeCollectionViewController

void(^didScroll1)(UIScrollView * scrollView);

- (void)viewDidLoad {
    [super viewDidLoad];
    
    didScroll1 = ^(UIScrollView * scrollView) {
        UIColor * color = [UIColor colorWithRed:0.27 green:0.75 blue:0.78 alpha:1.00];
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY > 50) {
            CGFloat alpha = MIN(1, 1 - ((50 + 64 - offsetY) / 64));
            [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
        } else {
            [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
        }
    };
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    __weak typeof(self) weakSelf = self;
    self.viewModel.dataUpdate = ^(){
        [weakSelf.collectionView reloadData];
    };
    [self.viewModel fetchData];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if(didScroll1) {
        didScroll1(self.collectionView);
    }
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}

- (DemoThreeViewModel *)viewModel {
    if(!_viewModel) {
        _viewModel = [[DemoThreeViewModel alloc]init];
    }
    return _viewModel;
}

- (UICollectionView *)collectionView {
    if(!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
        
        [_collectionView cb_makeDataSource:^(CBTableViewDataSourceMaker * make) {
            [make scrollViewDidScroll:didScroll1];
            
            [make makeSection:^(CBTableViewSectionMaker * section) {
                section.cell([CycleScrollCollectionViewCell class])
                .data(@[self.viewModel.ads])
                .adapter(^(CycleScrollCollectionViewCell * cell,NSArray * data,NSUInteger index){
                    cell.data = data;
                });
                section.size(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.48f));
            }];
            
            [make makeSection:^(CBTableViewSectionMaker * section) {
                section.cell([CategoryCollectionViewCell class])
                .data(self.viewModel.category)
                .adapter(^(CategoryCollectionViewCell * cell,NSDictionary * data,NSUInteger index){
                    
                    cell.imageView.image = [UIImage imageNamed:data[@"image"]];
                    cell.nameView.text = data[@"name"];

                });
                section.size(CGSizeMake(50, 60));
                section.inset(UIEdgeInsetsMake(15, 25, 15, 25));
                section.minimumInteritemSpacing(30);
                section.minimumLineSpacing(20);
            }];
            
            [make makeSection:^void(CBTableViewSectionMaker * section) {
                section.cell([HomeActivityCollectionViewCell class]);
                section.data(self.viewModel.activity);
                section.adapter(^(HomeActivityCollectionViewCell * cell,NSDictionary * data,NSUInteger index){
                    [cell.imgView setImage:[UIImage imageNamed:data[@"image"]]];
                });
                section.size(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.36f));
            }];
            
            [make makeSection:^void(CBTableViewSectionMaker * section) {
                section
                .cell([GoodsCollectionViewCell class])
                .data(self.viewModel.hotGoods)
                .adapter(^(GoodsCollectionViewCell * cell,NSDictionary * data,NSUInteger index){
                    if(index&1) {
                        cell.backgroundColor = [UIColor whiteColor];
                    } else {
                        cell.backgroundColor = [UIColor colorWithRed:0.95 green:0.96 blue:0.96 alpha:1.00];
                    }
                    [cell.imgView setImage:[UIImage imageNamed:data[@"image"]]];
                    [cell.nameView setText:data[@"name"]];
                    [cell.priceView setText:[NSString stringWithFormat:@"￥%@",data[@"price"]]];
                    [cell.infoView setText:data[@"info"]];
                });
                section.size(CGSizeMake(SCREEN_WIDTH, 160));
            }];
        }];

        
    }
    return _collectionView;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
