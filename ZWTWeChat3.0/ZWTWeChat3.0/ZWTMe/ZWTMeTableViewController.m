//
//  ZWTMeTableViewController.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/19.
//

#import "ZWTMeTableViewController.h"
#import <PhotosUI/PHPicker.h>
#import "ZWTLoginVC.h"
#import "ZWTImageCache.h"

@interface ZWTMeTableViewController () <PHPickerViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableViewCell *info;
@property (strong, nonatomic) IBOutlet UITableViewCell *zhifu;
@property (strong, nonatomic) IBOutlet UITableViewCell *sc;
@property (strong, nonatomic) IBOutlet UITableViewCell *pyq;
@property (strong, nonatomic) IBOutlet UITableViewCell *kb;
@property (strong, nonatomic) IBOutlet UITableViewCell *bq;
@property (strong, nonatomic) IBOutlet UIButton *selectBtn;
@property(nonatomic,strong)  NSArray *imageAry;
@property (strong, nonatomic) IBOutlet UIImageView *touxiang;
@property (strong, nonatomic) IBOutlet UIButton *logoutBtn;

@end

@implementation ZWTMeTableViewController



- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZWTImageCache *cache =  [[ZWTImageCache alloc]init];
    
    NSData *data = [cache getImageWithImageName:@"touxiang"];
    

        self.touxiang.image = [UIImage imageWithData:data];

  
       
    
    
    
    
    self.info.selectionStyle = UITableViewCellSelectionStyleNone;
    self.zhifu.selectionStyle = UITableViewCellSelectionStyleNone;
    self.sc.selectionStyle = UITableViewCellSelectionStyleNone;
    self.pyq.selectionStyle = UITableViewCellSelectionStyleNone;
    self.kb.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bq.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.selectBtn addTarget:self action:@selector(selectPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)selectPhoto{


    PHPickerConfiguration *config = [[PHPickerConfiguration alloc]init];
    config.selectionLimit = 1;
    config.filter = [PHPickerFilter imagesFilter];
    
    PHPickerViewController *pVC = [[PHPickerViewController alloc]initWithConfiguration:config];
    pVC.delegate = self;
    [self presentViewController:pVC animated:YES completion:nil];
    
}

- (void)logout{
    [self.navigationController popToRootViewControllerAnimated:NO];
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"LoginStatus"];
    
}



- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
    ZWTImageCache *cache = [[ZWTImageCache alloc]init];
    
    [cache deleteImageWithImageName:@"touxiang"];

    [picker dismissViewControllerAnimated:YES completion:nil];
    for (PHPickerResult *result in results) {

        [result.itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error) {
                    
            if ([object isKindOfClass:[UIImage class]]) {
               
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    self.touxiang.image = object;
                    
                    NSData *data = UIImagePNGRepresentation(object);
                    
                    
                    ZWTImageCache *cache = [[ZWTImageCache alloc]init];
                    
                    [cache storeImage:data withImageName:@"touxiang"];
                    
                   
                    
                });
            }
        }];
    }

    
}


@end
