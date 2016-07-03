//
//  SplitCollectionViewCell.m
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//
#import <Masonry/View+MASAdditions.h>
#import "SplitCollectionViewCell.h"

@implementation SplitCollectionViewCell

- (UILabel *)label {
    if(!_label) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker * make) {
            make.edges.equalTo(self);
        }];
        _label.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.59 alpha:1.00];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
