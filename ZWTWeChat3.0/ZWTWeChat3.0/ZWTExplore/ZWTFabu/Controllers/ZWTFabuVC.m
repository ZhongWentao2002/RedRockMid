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

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *placeholder;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) IBOutlet UIButton *fabuBtn;

@property (nonatomic,strong) UIImage *AddImg;
@property (nonatomic,strong) UICollectionView *cv;



@end

@implementation ZWTFabuVC


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *s = [def objectForKey:@"cachetext"];
    NSInteger count = [def integerForKey:@"count"];
    ZWTImageCache *cache = [[ZWTImageCache alloc]init];
    


    
    [self.fabuBtn addTarget:self action:@selector(popAndFabu) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    self.scrollView.contentSize = CGSizeMake(MAIN_SCREEN_W, MAIN_SCREEN_H - 53);
    self.scrollView.delegate = self;
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 60, MAIN_SCREEN_W - 40, 160)];
    self.textView.delegate = self;
    
    self.textView.text = s;
    [self.scrollView addSubview:self.textView];
    self.placeholder = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 30)];
    self.placeholder.textColor = [UIColor systemGray4Color];
    self.placeholder.text = @"这一刻的想法...";
    [self.textView addSubview:self.placeholder];
    if (!(self.textView.text.length == 0)) {
        self.placeholder.hidden = YES;
    }
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(60);
            make.right.left.bottom.offset(0);
    }];
    self.AddImg = [UIImage imageNamed:@"AddImg"];
    self.photoAry = [[NSMutableArray alloc]initWithCapacity:9];
    
    
    //1创建布局类
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //设置最行小间距
    layout.minimumLineSpacing = 10;
    //设置最小列间距
    layout.minimumInteritemSpacing = 10;
    //设置上下左右四边距
    layout.sectionInset = UIEdgeInsetsMake(15,15,15,15);
    //设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //2
    self.cv=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, 375, 467) collectionViewLayout:layout];
    self.cv.backgroundColor=[UIColor whiteColor];
    [self.scrollView addSubview:self.cv];
    self.cv.delegate = self;
    self.cv.dataSource = self;
    //注册cell
    [self.cv registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    if (self.textView.text.length == 0) {
        self.fabuBtn.enabled = NO;
        self.fabuBtn.backgroundColor = [UIColor systemGray2Color];
    }
    NSMutableArray * mArray = [[NSMutableArray alloc]initWithCapacity:9];
    for (int i = 0; i < count; i++) {
        
        NSData * data = [cache getImageWithImageName:[NSString stringWithFormat:@"cache%d",i]];
        UIImage *img = [UIImage imageWithData:data];
        [mArray addObject:img];
    }
    if (count == 0) {
        [self.photoAry addObject:self.AddImg];
        [self.cv reloadData];
    }
    else{
        self.photoAry = mArray;
        [self.cv reloadData];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.textView endEditing:YES];
}
- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length == 0) {
        self.placeholder.frame = CGRectMake(20, 0, 200, 30);
        self.placeholder.hidden = NO;
        self.fabuBtn.backgroundColor = [UIColor systemGray2Color];
        self.fabuBtn.enabled = NO;
    }
    else{
        self.fabuBtn.enabled = YES;
        self.fabuBtn.backgroundColor = [UIColor systemGreenColor];
        self.placeholder.frame = CGRectZero;
    }
}

- (void)pop{
    if (!(self.photoAry.count == 1 && self.textView.text.length == 0)) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出编辑" message:@"您想保存已编辑的内容吗" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *yes = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSArray *cacheArray = self.photoAry;
            NSString *cachetext = self.textView.text;
            ZWTImageCache *cache =[[ZWTImageCache alloc]init];
            for (int i = 0; i < cacheArray.count; i++) {
                NSData *data = UIImagePNGRepresentation(cacheArray[i]);
                [cache storeImage:data withImageName:[NSString stringWithFormat:@"cache%d",i]];
            }
            NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
            [def setInteger:cacheArray.count forKey:@"count"];
            [def setObject:cachetext forKey:@"cachetext"];
            [self.navigationController popViewControllerAnimated:YES];
            self.navigationController.navigationBar.hidden = NO;
            self.tabBarController.tabBar.hidden = NO;
        }];
        UIAlertAction *no = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        
            
            [def setObject:nil forKey:@"cachetext"];
            [def setInteger:0 forKey:@"count"];
            [self.navigationController popViewControllerAnimated:YES];
            self.navigationController.navigationBar.hidden = NO;
            self.tabBarController.tabBar.hidden = NO;
        }];
        
        [alert addAction:yes];
        [alert addAction:no];
        
        [self presentViewController:alert animated:YES completion:nil];
        

    }
    else{
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:nil forKey:@"cachetext"];
        [self.navigationController popViewControllerAnimated:YES];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = NO;
    }
}
- (void)popAndFabu{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    NSArray *array = self.photoAry;
    NSString *text = self.textView.text;
    self.getData(array, text);
}

#pragma mark- dataSource:跟tableview非常相似
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //控制个数
    return self.photoAry.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

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
    NSLog(@"点击了第%ld个item",indexPath.row);
    if (indexPath.item == 0) {
        PHPickerConfiguration *config = [[PHPickerConfiguration alloc]init];
        config.selectionLimit = 9;
        config.filter = [PHPickerFilter imagesFilter];
        PHPickerViewController *pVC = [[PHPickerViewController alloc]initWithConfiguration:config];
        pVC.delegate = self;
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
                    if (object) {
                        self.fabuBtn.enabled = YES;
                        self.fabuBtn.backgroundColor = [UIColor systemGreenColor];
                    }
                    [self.photoAry addObject:object];
                    [self.cv reloadData];
                });
            }
        }];
    }
}
@end
