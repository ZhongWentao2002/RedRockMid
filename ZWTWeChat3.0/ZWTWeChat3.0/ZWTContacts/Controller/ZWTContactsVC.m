//
//  ZWTContactsVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import "ZWTContactsVC.h"

//Pods
#import <Masonry.h>

//Model
#import "ZWTContactsData.h"

//View
#import "ZWTContactsCell.h"

@interface ZWTContactsVC () <UITableViewDataSource,UITableViewDelegate>

///联系人数据 （数组，内容是模型）
@property (nonatomic,strong) NSArray *contactsArray;
///可变模型数组 （可变数组，用来动态添加联系人数据）
@property (nonatomic,strong) NSMutableArray *arrayModel;
///联系人界面 （TableView）
@property (nonatomic,strong) UITableView *contactsListTV;


@end

@implementation ZWTContactsVC
# pragma mark ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    //加载子控件
    [self loadcontactsListTV];
}
# pragma mark -contactsListTV的数据源方法
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //返回组数
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //每组行数
    return self.contactsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //新建模型对象，获取对应行的数据
    ZWTContactsData *Data = self.contactsArray[indexPath.row];
    //新建Cell
    ZWTContactsCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ZWTContactsCell" owner:nil options:nil]firstObject];
    //赋值
    [cell.image setImage:[UIImage imageNamed:Data.contactImage]];
    cell.name.text = Data.contactName;
    return cell;
}
# pragma mark -contactsListTV的代理方法
//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
# pragma mark - 懒加载数据
- (NSArray *)contactsArray{
    if (_contactsArray == nil) {
        //获取路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ZWTContactsData.plist" ofType:nil];
        //初始化数组（里面存字典）
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        //初始化可变数组 （里面存模型）
        NSMutableArray *arrayModel = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            //创建模型对象
            ZWTContactsData *Data = [ZWTContactsData ContactsDatawithDict:dict];
            //每获得一个模型，往arrayModel里写入一个模型
            [arrayModel addObject:Data];
        }
        //将最终的数据复制给不可变数组contactsArray
        _contactsArray = arrayModel;
    }
    return _contactsArray;
}
# pragma mark - 加载contactsListTV
///加载contactsListTV
- (void)loadcontactsListTV{
    //新建TableView
    self.contactsListTV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    //去除多余的分割线
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    self.contactsListTV.tableFooterView = view;
    //代理对象
    self.contactsListTV.delegate = self;
    //数据源对象
    self.contactsListTV.dataSource = self;
    //添加到父控件
    [self.view addSubview:self.contactsListTV];
    //添加约束
    [self.contactsListTV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(44, 0, 49, 0));
    }];
}


@end
