//
//  MyCollectionViewCell.m
//  UICollectionView
//
//  Created by mac on 2017/11/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.bgIamge=[[UIImageView alloc]init];
        [self.contentView addSubview:self.bgIamge];
        self.bgIamge.frame=CGRectMake(0,0,100,100);
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
@end
