//
//  CustomCollectionViewCell.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) UIImageView * avatarView;
@property(nonatomic, strong) UILabel * nameLabel;
@property(nonatomic, strong) UILabel * titleLabel;
@property(nonatomic, strong) UILabel * detailLabel;

@property(nonatomic, strong) UIView * circleView;

-(void)configure:(NSDictionary * )row index:(NSNumber * )index;

@end
