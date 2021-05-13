//
//  ZWTMessageCell.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWTMessageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *contact;
@property (strong, nonatomic) IBOutlet UILabel *information;
@property (strong, nonatomic) IBOutlet UILabel *time;


@end

NS_ASSUME_NONNULL_END
