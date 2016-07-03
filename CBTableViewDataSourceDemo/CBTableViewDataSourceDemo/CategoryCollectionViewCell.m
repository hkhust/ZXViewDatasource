//
//  CategoryCollectionViewCell.m
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import "CategoryCollectionViewCell.h"
#import "View+MASAdditions.h"

@implementation CategoryCollectionViewCell

- (UIImageView *)imageView {
    if (! _imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker * make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-15);
            make.width.offset(30);
            make.height.offset(30);
        }];
    }
    return _imageView;
}

- (UILabel *)nameView {
    if(!_nameView) {
        _nameView = [[UILabel alloc] init];
        _nameView.font = [UIFont systemFontOfSize:14];
        _nameView.textColor = RGB(51,51,51);
        _nameView.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameView];
        [_nameView mas_makeConstraints:^(MASConstraintMaker * make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.imageView.mas_bottom).offset(8);
            make.width.equalTo(self);
            make.height.offset(22);
        }];
    }
    return _nameView;
}


@end
