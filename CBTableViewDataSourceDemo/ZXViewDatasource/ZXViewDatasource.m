//
//  ZXViewDatasource.m
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/6/30.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <objc/runtime.h>
#import "ZXViewDatasource.h"
#import "CBDataSourceSection.h"

@implementation ZXViewDatasource

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[(NSUInteger) section].data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    id cell = [tableView dequeueReusableCellWithIdentifier:self.sections[section].identifier forIndexPath:indexPath];
    AdapterBlock adaptBlock = self.sections[section].adapter;
    //NSLog(@"adaptBlock %@", [adaptBlock isEqual:nil]);
    if(!adaptBlock) {
#if DEBUG
        NSLog(@"Warning : adapter block for section %ld is null. please use dataSourceMake.adapter(^block) set it", (long) section);
#endif
        return cell;
    }
    id data = self.sections[section].data[index];
    adaptBlock(cell,data,index);
    return cell;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sections[(NSUInteger) section].data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.sections[section].identifier forIndexPath:indexPath];
    AdapterBlock adaptBlock = self.sections[section].adapter;
    //NSLog(@"adaptBlock %@", [adaptBlock isEqual:nil]);
    if(!adaptBlock) {
#if DEBUG
        NSLog(@"Warning : adapter block for section %ld is null. please use dataSourceMake.adapter(^block) set it", (long) section);
#endif
        return cell;
    }
    id data = self.sections[section].data[index];
    adaptBlock(cell,data,index);
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    //TODO:to do implementation
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.sections[section].identifier forIndexPath:indexPath];
    AdapterBlock adaptBlock = self.sections[section].adapter;
    //NSLog(@"adaptBlock %@", [adaptBlock isEqual:nil]);
    if(!adaptBlock) {
#if DEBUG
        NSLog(@"Warning : adapter block for section %ld is null. please use dataSourceMake.adapter(^block) set it", (long) section);
#endif
        return cell;
    }
    id data = self.sections[section].data[index];
    adaptBlock(cell,data,index);
    return cell;
}

@end