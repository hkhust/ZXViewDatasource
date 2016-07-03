//
//  CycleScrollCollectionViewCell.h
//  CBTableViewDataSourceDemo
//
//  Created by HK on 16/7/3.
//  Copyright © 2016年 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleScrollCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) UIScrollView * scrollView;
@property (nonatomic, retain) UIPageControl * pageControl;
@property (nonatomic, retain) NSArray * data;

@end
