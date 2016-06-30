//
//  DemoThreeViewModel.h
//  CBTableViewDataSourceDemo
//
//  Created by Cocbin on 16/6/4.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoThreeViewModel : NSObject

- (void)fetchData;

@property (nonatomic, retain) NSMutableArray * ads;
@property (nonatomic, retain) NSMutableArray * category;
@property (nonatomic, retain) NSMutableArray * activity;
@property (nonatomic, retain) NSMutableArray * hotGoods;

@property (nonatomic, copy) void(^dataUpdate)();

@end
