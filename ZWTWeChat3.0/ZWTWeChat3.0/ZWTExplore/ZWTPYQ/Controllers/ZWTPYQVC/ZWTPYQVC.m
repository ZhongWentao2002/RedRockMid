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
#import "CommentCell.h"
#import "ZWTCommentVC.h"


@interface ZWTPYQVC () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate>
///主 TableView
@property (strong, nonatomic) IBOutlet UITableView *tableview;
///跳转发布界面的按钮
@property (strong, nonatomic) IBOutlet UIButton *jumpBtn;
///最终动态模型数组
@property (nonatomic,strong) NSArray *PYQAry;
///可变模型数组
@property (nonatomic,strong) NSMutableArray *arrayModel;
///存图片数组的数组
@property (nonatomic,strong) NSMutableArray *photoAryAry;
//@property (nonatomic,strong) ZWTCommentVC *CVC;
@property (nonatomic,strong) NSMutableArray *McommentAry;
@property (nonatomic,copy) NSString *comment;


@end

@implementation ZWTPYQVC
#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    //隐藏NavBar
    self.navigationController.navigationBar.hidden = YES;
}
static int i = -1;
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    
    [super viewDidLoad];
    //懒加载数据
    NSString * path = [[NSBundle mainBundle]pathForResource:@"ZWTPYQData.plist" ofType:nil];
    NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
    _arrayModel = [NSMutableArray arrayWithCapacity:9];
    for (NSDictionary *dict in arrayDict) {
        ZWTPYQData *data = [ZWTPYQData PYQDatawithDict:dict];
        [_arrayModel addObject:data];
    }
    //完成赋值
    _PYQAry = self.arrayModel;
    //跳转的实现
    [self.jumpBtn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    //TableView初始化
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    //指定Cell高度可变
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    //预估高度（Required）
    self.tableview.estimatedRowHeight = 44;
    //删除多余的白线
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    self.tableview.tableFooterView = view;
    //初始化图片数组的数组
    _photoAryAry = [[NSMutableArray alloc]initWithCapacity:9];
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self selector:@selector(fabiaopinglun:) name:@"fabiaopinglun" object:nil];
    //新建评论控制器
   // self.CVC = [[ZWTCommentVC alloc]init];
    self.McommentAry = [[NSMutableArray alloc]initWithCapacity:99];
}
#pragma mark - 跳转至发布界面
- (void)jump{
    //初始化发布VC
    ZWTFabuVC *FVC = [[ZWTFabuVC alloc]init];
    //Weak修饰
    __weak typeof(self) weakSelf = self;
    //设置Block，功能:返回新增动态数据
    //参数 array:图片数组
    //       text:文本
    [FVC setGetData:^(NSArray * _Nonnull array, NSString * _Nonnull text) {
        //新建模型对象
        ZWTPYQData *data = [[ZWTPYQData alloc]init];
        //用户名:KDG
        data.Users = @"KDG";
        //文本
        data.mianTextLbl = text;
        //图片数量(实际发布界面所有图片减去一个加号图)
        data.photo_count = [NSNumber numberWithInteger:array.count - 1];
        //设置tag == 1;
        data.tag = 1;
       //将新的数据放在第一个位置
        [weakSelf.arrayModel insertObject:data atIndex:0];
        //赋值给最终数组
        weakSelf.PYQAry = weakSelf.arrayModel;
        //把array放在第一个位置
        [weakSelf.photoAryAry insertObject:array atIndex:0];
        //刷新控件
        [weakSelf.tableview reloadData];
    }];
    //PUSH
    [self.navigationController pushViewController:FVC animated:YES];
}

#pragma mark - Tableview数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //Section的个数
    return self.PYQAry.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZWTPYQData *data = self.PYQAry[section];
    
    return  (data.commentCount + 1);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZWTPYQData *data = self.PYQAry[indexPath.section];
    
     __block ZWTCommentVC *CVC = [[ZWTCommentVC alloc]init];
    [CVC setBlock:^{
        i += 1;
        data.commentCount += 1;
        NSString *comment = [[NSString alloc]init];
        comment = CVC.textView.text;
        if (!data.commenttextAry) {
            data.commenttextAry = [[NSMutableArray alloc]initWithCapacity:99];
        }
        [self->_McommentAry addObject:comment];
        [data.commenttextAry addObject:comment];
        [self.tableview reloadData];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    //如果是第0行  (动态内容)
    if (indexPath.row == 0) {
        //拿到对应Section的数据
        
        //拿到图片个数
        int i = [data.photo_count intValue];
        //如果是新增的cell
        if (data.tag == 1) {
            //拿到当前的图片数组 （由Section，从photoAryAry中取）
            NSArray *currentphotoAry = [NSArray array];
            currentphotoAry = self.photoAryAry[indexPath.section];
            if (i == 0) {
                MyTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:nil options:nil]firstObject];
                [cell setBlock:^{
                   [self.navigationController pushViewController:CVC animated:YES];
                }];
                cell.Users.text = data.Users;
                cell.mianTextLbl.text = data.mianTextLbl;
                return cell;
            }
            else if (i == 1) {
                MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
                cell.user.text = data.Users;
                cell.maintext.text = data.mianTextLbl;
                cell.image1.image = currentphotoAry[1];
            return cell;
            }
            else if (i == 2){
                MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
                cell.user.text = data.Users;
                cell.maintext.text = data.mianTextLbl;
                cell.image1.image = currentphotoAry[1];
                cell.image2.image = currentphotoAry[2];
            return cell;
            }
            else if (i == 3){
                MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
                cell.user.text = data.Users;
                cell.maintext.text = data.mianTextLbl;
                cell.image1.image = currentphotoAry[1];
                cell.image2.image = currentphotoAry[2];
                cell.image3.image = currentphotoAry[3];
            return cell;
            }
            else if (i == 4){
                MyTableViewCell4 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell4" owner:nil options:nil]firstObject];
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
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
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
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
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
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
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
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
        }
        //已经存在的cell
        else{
            //若无图片
            if (i == 0) {
                MyTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:nil options:nil]firstObject];
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
                
                cell.Users.text = data.Users;
                cell.mianTextLbl.text = data.mianTextLbl;
                return cell;
            }
            else if (i == 2) {
                //有两张图片（已知plist）
                MyTableViewCell3 *cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell3" owner:nil options:nil]firstObject];
        
                [cell setBlock:^{
                    [self.navigationController pushViewController:CVC animated:YES];
                }];
                cell.user.text = data.Users;
                cell.maintext.text = data.mianTextLbl;
                cell.image1.image = [UIImage imageNamed:@"M1"];
                cell.image2.image = [UIImage imageNamed:@"Mac"];
            return cell;
            }
        }
    } //不是第0行 (评论)
    else{
        CommentCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"CommentCell" owner:nil options:nil]firstObject];
        cell.User.text = @"KDG";
       // cell.commentLbl.text = self.McommentAry[indexPath.row - 1];
        cell.commentLbl.text = data.commenttextAry[indexPath.row - 1];
        return cell;
    }
    return nil;
}

@end
