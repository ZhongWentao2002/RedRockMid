//
//  ZWTMeTableViewController.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/19.
//

#import "ZWTMeTableViewController.h"
//PHPicker
#import <PhotosUI/PHPicker.h>
//图片缓存工具
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


#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    //隐藏navigatoionBar
    self.navigationController.navigationBar.hidden = YES;
}
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    //新建缓存工具对象
    ZWTImageCache *cache =  [[ZWTImageCache alloc]init];
    //读取本地存储名为"touxiang"的png文件
    NSData *data = [cache getImageWithImageName:@"touxiang"];
    //设置头像
    self.touxiang.image = [UIImage imageWithData:data];
    //取消选中效果
    self.info.selectionStyle = UITableViewCellSelectionStyleNone;
    self.zhifu.selectionStyle = UITableViewCellSelectionStyleNone;
    self.sc.selectionStyle = UITableViewCellSelectionStyleNone;
    self.pyq.selectionStyle = UITableViewCellSelectionStyleNone;
    self.kb.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bq.selectionStyle = UITableViewCellSelectionStyleNone;
    //换头像按钮
    [self.selectBtn addTarget:self action:@selector(selectPhoto) forControlEvents:UIControlEventTouchUpInside];
    //退出登录按钮
    [self.logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    

}

#pragma - mark 私有方法
//弹出PHPicker
- (void)selectPhoto{
    PHPickerConfiguration *config = [[PHPickerConfiguration alloc]init];
    config.selectionLimit = 1;
    config.filter = [PHPickerFilter imagesFilter];
    PHPickerViewController *pVC = [[PHPickerViewController alloc]initWithConfiguration:config];
    pVC.delegate = self;
    [self presentViewController:pVC animated:YES completion:nil];
}
//登出
- (void)logout{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出登录" message:@"您确定要退出登录吗" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"LoginStatus"];
    }];
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alert addAction:yes];
    [alert addAction:no];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


#pragma - mark PHPicker Delegate
- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
    //picker消失时的操作
    [picker dismissViewControllerAnimated:YES completion:nil];
    //遍历
    for (PHPickerResult *result in results) {
        [result.itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error) {
            //如果结果的类型是UIImage
            if ([object isKindOfClass:[UIImage class]]) {
               //获取主线程（更新UI）
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置头像
                    self.touxiang.image = object;
                    //序列化
                    NSData *data = UIImagePNGRepresentation(object);
                    //新建工具
                    ZWTImageCache *cache = [[ZWTImageCache alloc]init];
                    //删除数据
                    [cache deleteImageWithImageName:@"touxiang"];
                    //写入新数据
                    [cache storeImage:data withImageName:@"touxiang"];
                });
            }
        }];
    }
}
@end
