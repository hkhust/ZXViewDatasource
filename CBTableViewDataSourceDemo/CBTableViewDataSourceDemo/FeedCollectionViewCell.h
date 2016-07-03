//
//  FeedCollectionViewCell.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCollectionViewCell : UICollectionViewCell

@property(nonatomic, retain) UIImageView * avatarView;
@property(nonatomic, strong) UIView * userView;
@property(nonatomic, retain) UILabel * nameView;
@property(nonatomic, retain) UILabel * dateView;
@property(nonatomic, retain) UILabel * detailView;
@property(nonatomic, retain) UIImageView * imgView;

@end
