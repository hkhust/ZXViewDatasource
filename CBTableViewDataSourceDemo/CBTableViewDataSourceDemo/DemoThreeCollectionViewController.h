//
//  DemoThreeCollectionViewController.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoThreeViewModel;

@interface DemoThreeCollectionViewController : UIViewController

@property(nonatomic, retain) DemoThreeViewModel * viewModel;

@property(nonatomic, retain) UICollectionView * collectionView;

@end
