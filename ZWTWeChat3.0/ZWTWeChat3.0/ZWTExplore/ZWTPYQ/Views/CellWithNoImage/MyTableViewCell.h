//
//  MyTableViewCell.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *mianTextLbl;
@property (strong, nonatomic) IBOutlet UILabel *Users;
@property (copy,nonatomic) void(^block)(void);
@property (strong, nonatomic) IBOutlet UIButton *commentBtn;



@end

NS_ASSUME_NONNULL_END
