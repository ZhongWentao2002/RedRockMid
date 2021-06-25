//
//  MyTableViewCell4.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/25.
//

#import "MyTableViewCell4.h"

@implementation MyTableViewCell4

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
