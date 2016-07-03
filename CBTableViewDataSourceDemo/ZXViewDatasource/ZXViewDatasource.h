//
//  ZXViewDatasource.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/6/30.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIkit.h>

@class CBDataSourceSection;

@protocol CBBaseTableViewDataSourceProtocol<UITableViewDataSource,UICollectionViewDataSource>

@property(nonatomic, strong) NSMutableArray<CBDataSourceSection * > * sections;

@end

typedef void (^AdapterBlock)(id cell,id data,NSUInteger index);

@class CBDataSourceSection;

@interface ZXViewDatasource : NSObject <CBBaseTableViewDataSourceProtocol>

@property(nonatomic, strong) NSMutableArray<CBDataSourceSection * > * sections;

@end
