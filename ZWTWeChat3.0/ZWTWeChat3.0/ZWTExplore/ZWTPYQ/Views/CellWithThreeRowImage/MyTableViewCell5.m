//
//  MyTableViewCell5.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/25.
//

#import "MyTableViewCell5.h"

@implementation MyTableViewCell5

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (IBAction)CommentBtn:(UIButton *)sender {
    self.block();
}
@end
