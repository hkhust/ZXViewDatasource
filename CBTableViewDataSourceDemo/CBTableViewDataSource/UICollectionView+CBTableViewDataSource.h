//
//  UICollectionView+CBTableViewDataSource.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBBaseTableViewDataSource;
@class CBTableViewDataSourceMaker;

@interface UICollectionView (CBTableViewDataSource)

@property(nonatomic, strong) CBBaseTableViewDataSource * cbTableViewDataSource;

- (void)cb_makeDataSource:(void (^)(CBTableViewDataSourceMaker * make))maker;
- (void)cb_makeSectionWithData:(NSArray *)data;
- (void)cb_makeSectionWithData:(NSArray *)data andCellClass:(Class)cellClass;

@end
