//
//  DemoOneCollectionViewController.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoOneViewModel;
@class DemoTwoViewModel;

@interface DemoOneCollectionViewController : UIViewController

@property(nonatomic, strong) DemoOneViewModel * viewModel;
@property(nonatomic, strong) UICollectionView * collectionView;

@end
