//
//  DemoFourCollectionViewController.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DemoFourViewModel;

@interface DemoFourCollectionViewController : UIViewController

@property(nonatomic, retain) DemoFourViewModel * viewModel;

@property(nonatomic, retain) UICollectionView * collectionView;

@end
