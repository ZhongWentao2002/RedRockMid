//
//  ZWTPYQVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/22.
//

#import "ZWTPYQVC.h"
#import "ZWTFabuVC.h"
#import "MyTableViewCell.h"
#import <PhotosUI/PHPicker.h>
#import "ZWTPYQData.h"
#import "MyTableViewCell3.h"
#import "MyTableViewCell4.h"
#import "MyTableViewCell5.h"
@interface ZWTPYQVC () <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (strong, nonatomic) IBOutlet UIButton *jumpBtn;
@property (nonatomic,strong) NSArray *photoAry;
@property (nonatomic,strong) UICollectionView *cv;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,strong) NSArray *PYQAry;
@property (nonatomic,strong) NSMutableArray *arrayModel;
@property (nonatomic,strong) NSMutableArray *photoAryAry;
@end

@implementation ZWTPYQVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * path = [[NSBundle mainBundle]pathForResource:@"ZWTPYQData.plist" ofType:nil];
    NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
    _arrayModel = [NSMutableArray arrayWithCapacity:9];
    for (NSDictionary *dict in arrayDict) {
        ZWTPYQData *data = [ZWTPYQData PYQDatawithDict:dict];
        [_arrayModel addObject:data];
    }
    _PYQAry = self.arrayModel;
    [self.jumpBtn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.estimatedRowHeight = 44;
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    self.tableview.tableFooterView = view;
    _photoAryAry = [[NSMutableArray alloc]initWithCapacity:9];
    
}
- (void)jump{
    ZWTFabuVC *FVC = [[ZWTFabuVC alloc]init];
    __weak typeof(self) weakSelf = self;
    [FVC setGetData:^(NSArray * _Nonnull array, NSString * _Nonnull text) {
        ZWTPYQData *data = [[ZWTPYQData alloc]init];
        data.Users = @"KDG";
        data.mianTextLbl = text;
        data.photo_count = [NSNumber numberWithInteger:array.count - 1];
        data.tag = 1;
        [weakSelf.arrayModel insertObject:data atIndex:0];
        weakSelf.PYQAry = weakSelf.arrayModel;
        weakSelf.photoAry = array;
        [weakSelf.photoAryAry insertObject:array atIndex:0];
        [weakSelf.tableview reloadData];
    }];
    [self.navigationController pushViewController:FVC animated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.PYQAry.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ZWTPYQData *data = self.PYQAry[indexPath.section];
    int i = [data.photo_count intValue];
    //如果是新增的cell
    if (data.tag == 1) {
        NSArray *currentphotoAry = [NSArray array];
        currentphotoAry = self.photoAryAry[indexPath.section];
        if (i == 0) {
            MyTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:nil options:nil]firstObject];
            cell.Users.text = data.Users;
            cell.mianTextLbl.text = data.mianTextLbl;
            return cell;
        }
        else if (i == 1) {
            MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
            cell.user.text = data.Users;
            cell.maintext.text = data.mianTextLbl;
            cell.image1.image = currentphotoAry[1];
        return cell;
        }
        else if (i == 2){
            MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
            cell.user.text = data.Users;
            cell.maintext.text = data.mianTextLbl;
            cell.image1.image = currentphotoAry[1];
            cell.image2.image = currentphotoAry[2];
        return cell;
        }
        else if (i == 3){
            MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
            cell.user.text = data.Users;
            cell.maintext.text = data.mianTextLbl;
            cell.image1.image = currentphotoAry[1];
            cell.image2.image = currentphotoAry[2];
            cell.image3.image = currentphotoAry[3];
        return cell;
        }
        else if (i == 4){
            MyTableViewCell4 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell4" owner:nil options:nil]firstObject];
            cell.userlbl.text = data.Users;
            cell.maintextlbl.text = data.mianTextLbl;
            cell.img1.image = currentphotoAry[1];
            cell.img2.image = currentphotoAry[2];
            cell.img3.image = currentphotoAry[3];
            cell.img4.image = currentphotoAry[4];
        return cell;
        }
        else if (i == 5){
            MyTableViewCell4 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell4" owner:nil options:nil]firstObject];
            cell.userlbl.text = data.Users;
            cell.maintextlbl.text = data.mianTextLbl;
            cell.img1.image = currentphotoAry[1];
            cell.img2.image = currentphotoAry[2];
            cell.img3.image = currentphotoAry[3];
            cell.img4.image = currentphotoAry[4];
            cell.img5.image = currentphotoAry[5];
        return cell;
        }
        else if (i == 6){
            MyTableViewCell4 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell4" owner:nil options:nil]firstObject];
            cell.userlbl.text = data.Users;
            cell.maintextlbl.text = data.mianTextLbl;
            cell.img1.image = currentphotoAry[1];
            cell.img2.image = currentphotoAry[2];
            cell.img3.image = currentphotoAry[3];
            cell.img4.image = currentphotoAry[4];
            cell.img5.image = currentphotoAry[5];
            cell.img6.image = currentphotoAry[6];
        return cell;
        }
        else if (i == 7){
            MyTableViewCell5 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell5" owner:nil options:nil]firstObject];
            cell.userlbl.text = data.Users;
            cell.maintextlbl.text = data.mianTextLbl;
            cell.img1.image = currentphotoAry[1];
            cell.img2.image = currentphotoAry[2];
            cell.img3.image = currentphotoAry[3];
            cell.img4.image = currentphotoAry[4];
            cell.img5.image = currentphotoAry[5];
            cell.img6.image = currentphotoAry[6];
            cell.img7.image = currentphotoAry[7];
        return cell;
        }
        else if (i == 8){
            MyTableViewCell5 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell5" owner:nil options:nil]firstObject];
            cell.userlbl.text = data.Users;
            cell.maintextlbl.text = data.mianTextLbl;
            cell.img1.image = currentphotoAry[1];
            cell.img2.image = currentphotoAry[2];
            cell.img3.image = currentphotoAry[3];
            cell.img4.image = currentphotoAry[4];
            cell.img5.image = currentphotoAry[5];
            cell.img6.image = currentphotoAry[6];
            cell.img7.image = currentphotoAry[7];
            cell.img8.image = currentphotoAry[8];
        return cell;
        }
        else if (i == 9){
            MyTableViewCell5 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell5" owner:nil options:nil]firstObject];
            cell.userlbl.text = data.Users;
            cell.maintextlbl.text = data.mianTextLbl;
            cell.img1.image = currentphotoAry[1];
            cell.img2.image = currentphotoAry[2];
            cell.img3.image = currentphotoAry[3];
            cell.img4.image = currentphotoAry[4];
            cell.img5.image = currentphotoAry[5];
            cell.img6.image = currentphotoAry[6];
            cell.img7.image = currentphotoAry[7];
            cell.img8.image = currentphotoAry[8];
            cell.img9.image = currentphotoAry[9];
        return cell;
        }
    }                    //已经存在的cell
    else{
        //若无图片
        if (i == 0) {
            MyTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:nil options:nil]firstObject];
            cell.Users.text = data.Users;
            cell.mianTextLbl.text = data.mianTextLbl;
            return cell;
        }
        else if (i == 2) {
            //有两张图片（已知plist）
            MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
            cell.user.text = data.Users;
            cell.maintext.text = data.mianTextLbl;
            cell.image1.image = [UIImage imageNamed:@"M1"];
            cell.image2.image = [UIImage imageNamed:@"Mac"];
        return cell;
        }
    }
    return nil;
}

@end
