//
//  MyTableViewCell3.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/25.
//

#import "MyTableViewCell3.h"
#import "ZWTCommentVC.h"
@implementation MyTableViewCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


- (IBAction)CommentBtn:(UIButton *)sender {
    self.block();
}
@end
