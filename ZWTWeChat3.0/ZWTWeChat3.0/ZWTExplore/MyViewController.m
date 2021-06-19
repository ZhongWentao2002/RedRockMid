//
//  MyViewController.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/20.
//

#import "MyViewController.h"
#import "ZWTImageCache.h"
@interface MyViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic,strong) NSData *data;

@end

@implementation MyViewController

- (void)viewWillAppear:(BOOL)animated{
    

    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ZWTImageCache *cache = [[ZWTImageCache alloc]init];
    
    self.data = [cache getImageWithImageName:@"touxiang"];
    self.image.image = [UIImage imageWithData:self.data];

  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
