//
//  ZWTContactsCell.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import "ZWTContactsCell.h"

@implementation ZWTContactsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //设置选中样式为"无"
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
