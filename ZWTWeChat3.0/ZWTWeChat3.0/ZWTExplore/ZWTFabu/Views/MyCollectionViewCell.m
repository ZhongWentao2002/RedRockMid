//
//  MyCollectionViewCell.m
//  UICollectionView
//
//Created by 钟文韬 on 2021/6/22.
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
