//
//  FinderCell.h
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FinderCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *text;
@property (strong, nonatomic) IBOutlet UILabel *image_count;

@end

NS_ASSUME_NONNULL_END
