//
//  ZWTFabuVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/22.
//

#import "ZWTFabuVC.h"
#import <Masonry.h>
#import "PrefixHeader.pch"
#import <PhotosUI/PHPicker.h>
#import "MyCollectionViewCell.h"
#import "ZWTImageCache.h"




@interface ZWTFabuVC () <UIScrollViewDelegate,UITextViewDelegate,PHPickerViewControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

///主 scrollView
@property (nonatomic,strong) UIScrollView *scrollView;
///文本框
@property (nonatomic,strong) UITextView *textView;
///placeholder
@property (nonatomic,strong) UILabel *placeholder;
///取消按钮
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
///发布按钮
@property (strong, nonatomic) IBOutlet UIButton *fabuBtn;
///加号图片
@property (nonatomic,strong) UIImage *AddImg;
///collectionview
@property (nonatomic,strong) UICollectionView *cv;



@end

@implementation ZWTFabuVC

#pragma mark - ViewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    //隐藏NavBar
    self.navigationController.navigationBar.hidden = YES;
    //隐藏TabBar
    self.tabBarController.tabBar.hidden = YES;
}
#pragma mark - ViewDidLoad
- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    //读取缓存的文本
    NSString *s = [def objectForKey:@"cachetext"];
    //读取缓存的图片
    NSInteger count = [def integerForKey:@"count"];
    //新建我的缓存工具对象
    ZWTImageCache *cache = [[ZWTImageCache alloc]init];
    


    //为按钮添加Target
    [self.fabuBtn addTarget:self action:@selector(popAndFabu) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    //初始化scrollView
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    self.scrollView.contentSize = CGSizeMake(MAIN_SCREEN_W, MAIN_SCREEN_H - 53);
    self.scrollView.delegate = self;
    //初始化textView
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 60, MAIN_SCREEN_W - 40, 160)];
    self.textView.delegate = self;
    self.textView.text = s;
    //添加子控件
    [self.scrollView addSubview:self.textView];
    //初始化placeholder
    self.placeholder = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 30)];
    self.placeholder.textColor = [UIColor systemGray4Color];
    self.placeholder.text = @"这一刻的想法...";
    //添加子控件
    [self.textView addSubview:self.placeholder];
    //如果当前文本不等于0
    if (!(self.textView.text.length == 0)) {
        //隐藏placeholder
        self.placeholder.hidden = YES;
    }
    //添加子控件
    [self.view addSubview:self.scrollView];
    //设置约束
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(60);
            make.right.left.bottom.offset(0);
    }];
    //设置加号图片
    self.AddImg = [UIImage imageNamed:@"AddImg"];
    //初始化图片数组
    self.photoAry = [[NSMutableArray alloc]initWithCapacity:9];
    
    
    //创建布局类
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //设置最行小间距
    layout.minimumLineSpacing = 10;
    //设置最小列间距
    layout.minimumInteritemSpacing = 10;
    //设置上下左右四边距
    layout.sectionInset = UIEdgeInsetsMake(15,15,15,15);
    //设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //初始化collectionview
    self.cv=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, 375, 467) collectionViewLayout:layout];
    self.cv.backgroundColor=[UIColor whiteColor];
    [self.scrollView addSubview:self.cv];
    self.cv.delegate = self;
    self.cv.dataSource = self;
    //注册cell
    [self.cv registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //如果文本为0
    if (self.textView.text.length == 0) {
        //发布按钮禁用,颜色为灰
        self.fabuBtn.enabled = NO;
        self.fabuBtn.backgroundColor = [UIColor systemGray2Color];
    }
    //初始化一个可变数组mArray，用来暂存数据
    NSMutableArray * mArray = [[NSMutableArray alloc]initWithCapacity:9];
    //从缓存中加载图片 图片名字为 cache 加 编号
    for (int i = 0; i < count; i++) {
        NSData * data = [cache getImageWithImageName:[NSString stringWithFormat:@"cache%d",i]];
        UIImage *img = [UIImage imageWithData:data];
        //存储在mArray中
        [mArray addObject:img];
    }
    //如果缓存图片数量 == 0 (Required)
    if (count == 0) {
        [self.photoAry addObject:self.AddImg];
        [self.cv reloadData];
    } // (Optional)
    else{
        //读取图片
        self.photoAry = mArray;
        //刷新控件
        [self.cv reloadData];
    }
}

#pragma mark - scrollView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //当滑动时，停止编辑
    [self.textView endEditing:YES];
}
#pragma mark - textView代理
- (void)textViewDidChange:(UITextView *)textView{
    //文本为0
    if (textView.text.length == 0) {
        //有placeholder
        self.placeholder.frame = CGRectMake(20, 0, 200, 30);
        self.placeholder.hidden = NO;
        //发布按钮不可用，为灰色
        self.fabuBtn.backgroundColor = [UIColor systemGray2Color];
        self.fabuBtn.enabled = NO;
    }
    else{
        //发布按钮可用，为绿色
        self.fabuBtn.enabled = YES;
        self.fabuBtn.backgroundColor = [UIColor systemGreenColor];
        //无placeholder
        self.placeholder.frame = CGRectZero;
    }
}
#pragma mark - 私有方法
#pragma mark pop
- (void)pop{
    //如果有内容 (所选图片 > 0 或 文本 > 0)
    if (!(self.photoAry.count == 1 && self.textView.text.length == 0)) {
        //设置弹窗
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出编辑" message:@"您想保存已编辑的内容吗" preferredStyle:UIAlertControllerStyleAlert];
        //设置操作 yes (保存数据)
        UIAlertAction *yes = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //得到当前数据
            NSArray *cacheArray = self.photoAry;
            NSString *cachetext = self.textView.text;
            //进行缓存操作 图片名字为 cache 加 编号
            ZWTImageCache *cache =[[ZWTImageCache alloc]init];
            for (int i = 0; i < cacheArray.count; i++) {
                NSData *data = UIImagePNGRepresentation(cacheArray[i]);
                [cache storeImage:data withImageName:[NSString stringWithFormat:@"cache%d",i]];
            }
            //NSUserDefaults 图片数量与文本
            NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
            //数量
            [def setInteger:cacheArray.count forKey:@"count"];
            //文本
            [def setObject:cachetext forKey:@"cachetext"];
            [self.navigationController popViewControllerAnimated:YES];
            self.navigationController.navigationBar.hidden = NO;
            self.tabBarController.tabBar.hidden = NO;
        }];
        //设置操作 no (不保存数据)
        UIAlertAction *no = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            //得到当前数据
            NSArray *cacheArray = self.photoAry;
            //进行删除缓存操作 图片名字为 cache 加 编号
            ZWTImageCache *cache =[[ZWTImageCache alloc]init];
            for (int i = 0; i < cacheArray.count; i++) {
                [cache deleteImageWithImageName:[NSString stringWithFormat:@"cache%d",i]];
            }
            NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
            //删除缓存数据
            [def setObject:nil forKey:@"cachetext"];
            [def setInteger:0 forKey:@"count"];
            [self.navigationController popViewControllerAnimated:YES];
            self.navigationController.navigationBar.hidden = NO;
            self.tabBarController.tabBar.hidden = NO;
        }];
        //添加弹窗操作
        [alert addAction:yes];
        [alert addAction:no];
        //展示弹窗
        [self presentViewController:alert animated:YES completion:nil];
        

    }
    //无内容，直接退出
    else{
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:nil forKey:@"cachetext"];
        [self.navigationController popViewControllerAnimated:YES];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = NO;
    }
}
#pragma mark popAndFabu
- (void)popAndFabu{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    //获取数据
    NSArray *array = self.photoAry;
    NSString *text = self.textView.text;
    //以Block返回
    self.getData(array, text);
}

#pragma mark - collectionView数据源
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{  //个数
    return self.photoAry.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{      //cell
        MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        //image
        cell.bgIamge.image = self.photoAry[indexPath.item];

    return cell;
}

#pragma mark- delegate
//控制每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}
//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //第一个item (加号图片)
    if (indexPath.item == 0) {
        //PHPickerConfiguration
        PHPickerConfiguration *config = [[PHPickerConfiguration alloc]init];
        //个数限制
        config.selectionLimit = 9;
        //filter
        config.filter = [PHPickerFilter imagesFilter];
        //新建 PHPickerViewController ： pVC
        PHPickerViewController *pVC = [[PHPickerViewController alloc]initWithConfiguration:config];
        //代理
        pVC.delegate = self;
        //show
        [self presentViewController:pVC animated:YES completion:nil];
    }
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
                    //如果有图片
                    if (object) {
                        self.fabuBtn.enabled = YES;
                        self.fabuBtn.backgroundColor = [UIColor systemGreenColor];
                    }
                    //把图片加载到数组photoAry中
                    [self.photoAry addObject:object];
                    //刷新UI
                    [self.cv reloadData];
                });
            }
        }];
    }
}
@end
