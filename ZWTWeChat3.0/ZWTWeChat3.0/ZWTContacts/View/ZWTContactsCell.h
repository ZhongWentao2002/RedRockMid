//
//  ZWTContactsCell.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWTContactsCell : UITableViewCell
///联系人头像
@property (strong, nonatomic) IBOutlet UIImageView *image;
///联系人名字
@property (strong, nonatomic) IBOutlet UILabel *name;

@end

NS_ASSUME_NONNULL_END
