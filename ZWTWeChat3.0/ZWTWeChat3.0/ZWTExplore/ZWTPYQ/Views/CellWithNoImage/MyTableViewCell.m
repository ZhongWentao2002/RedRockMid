//
//  MyTableViewCell.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/24.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [_commentBtn addTarget:self action:@selector(postcomment:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void)postcomment:(UIButton *)btn{
    self.block();
}
@end
