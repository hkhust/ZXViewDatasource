//
// Created by Cocbin on 16/6/12.
// Copyright (c) 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBTableViewDataSource.h"

@interface CBDataSourceSection : NSObject

@property(nonatomic, strong) NSArray * data;
@property(nonatomic, strong) Class cell;
@property(nonatomic, strong) NSString * identifier;
@property(nonatomic, copy) AdapterBlock adapter;
@property(nonatomic, copy) EventBlock event;

@property(nonatomic, strong) UIView * headerView;
@property(nonatomic, strong) UIView * footerView;
//UITableView
@property(nonatomic, strong) NSString * headerTitle;
@property(nonatomic, strong) NSString * footerTitle;

@property(nonatomic, assign) BOOL isAutoHeight;
@property(nonatomic, assign) CGFloat staticHeight;

@property(nonatomic, assign) UITableViewCellStyle tableViewCellStyle;
//UICollectionView
@property(nonatomic, assign) CGSize staticSize;
@property(nonatomic, assign) UIEdgeInsets inset;
@property(nonatomic, assign) CGFloat minimumLineSpacing;
@property(nonatomic, assign) CGFloat minimumInteritemSpacing;

@end