//
//  FinderController.m
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import "FinderController.h"
#import "FinderData.h"
#import "FinderCell.h"
#import "FabuController.h"
#import "XiangqingController.h"


@interface FinderController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *finderData;
@property (nonatomic,strong) UITableView *finderList;
@property (nonatomic,strong) NSMutableArray *arrayModel;

@end

@implementation FinderController

- (void)viewDidLoad {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Finder.plist" ofType:nil];
    NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
    self.arrayModel = [NSMutableArray array];
    for (NSDictionary *dict in arrayDict) {
        //创建模型对象
        FinderData *Data = [FinderData finderDatawithDict:dict];
        [self.arrayModel addObject:Data];
    }
    self.finderData = self.arrayModel;
    
    self.finderList = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 375, 574) style:UITableViewStylePlain];
    self.finderList.delegate = self;
    self.finderList.dataSource = self;
    self.finderList.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.finderList];
    [super viewDidLoad];
   
    

}

//数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.finderData.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FinderData *Data = self.finderData[indexPath.row];
  
    FinderCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FinderCell" owner:nil options:nil]firstObject];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.image setImage:[UIImage imageNamed:Data.image]];
    cell.image_count.text = Data.image_count;
    cell.text.text = Data.text;
    cell.time.text = Data.time;
    
    
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    //隐藏tabbar
    self.tabBarController.tabBar.hidden = YES;
    
    //点击第一个进入发布界面
    if (indexPath.row == 0) {
        FabuController *fc = [[FabuController alloc]init];
        [self.navigationController pushViewController:fc animated:YES];
    }
    
    //点击非第一个个进入朋友圈详情界面
    else{
        XiangqingController *xqc = [[XiangqingController alloc]init];
        [self.navigationController pushViewController:xqc animated:YES];
    }
}


@end
