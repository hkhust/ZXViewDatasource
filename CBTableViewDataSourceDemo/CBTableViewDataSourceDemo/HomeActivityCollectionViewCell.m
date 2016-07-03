//
//  HomeActivityCollectionViewCell.m
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import "HomeActivityCollectionViewCell.h"
#import <Masonry/View+MASAdditions.h>

@implementation HomeActivityCollectionViewCell

- (UIImageView *)imgView {
    if(!_imgView) {
        self.backgroundColor = [UIColor whiteColor];
        _imgView = [[UIImageView alloc] init];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker * make) {
            make.bottom.equalTo(self).offset(-8);
            make.left.equalTo(self).offset(8);
            make.width.equalTo(self).offset(-16);
            make.height.equalTo(self).offset(-8);
        }];
    }
    return _imgView;
}

@end
