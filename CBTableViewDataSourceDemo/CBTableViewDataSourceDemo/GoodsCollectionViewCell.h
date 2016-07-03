//
//  GoodsCollectionViewCell.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) UIImageView * imgView;
@property (nonatomic, retain) UILabel * nameView;
@property (nonatomic, retain) UILabel * priceView;
@property(nonatomic, strong) UILabel * infoView;

@end
