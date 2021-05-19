//
//  ZWTWeChatPageVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import "ZWTWeChatPageVC.h"
//Pods
#import <Masonry.h>

//Model
#import "ZWTMessageData.h"

//View
#import "ZWTMessageCell.h"


@interface ZWTWeChatPageVC () <UITableViewDataSource,UITableViewDelegate>

///聊天数据 （数组，内容是模型）
@property (nonatomic,strong) NSArray *messageArray;
///可变模型数组（可变数组，用来动态添加聊天数据）
@property (nonatomic,strong) NSMutableArray *arrayModel;
///聊天界面 （TableView）
@property (nonatomic,strong) UITableView *messageListTV;


@end

@implementation ZWTWeChatPageVC

- (void)viewDidLoad {
# pragma mark - life cycle
# pragma mark ViewDidLoad
    [super viewDidLoad];
    [self loadMessageListTV];
}

# pragma mark - messageListTV的数据源方法
//设置多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArray.count;
}
//创建单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取模型数据
    ZWTMessageData *data = self.messageArray[indexPath.row];
    //从xib加载Cell
    ZWTMessageCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ZWTMessageCell" owner:nil options:nil]firstObject];
    //给Cell赋值
    cell.contact.text = data.contacts;
    [cell.image setImage:[UIImage imageNamed:data.contactsImage]];
    cell.information.text = data.information;
    cell.time.text = data.time;
    //返回Cell
    return  cell;
}

# pragma mark - messageListTV的代理方法
//设置Cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;
}
# pragma mark - 懒加载数据
- (NSArray *)messageArray{
    if (_messageArray == nil) {
    //获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ZWTMessageData.plist" ofType:nil];
    //初始化数组（里面存字典）
    NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
    //初始化可变数组 （里面存模型）
    _arrayModel = [NSMutableArray array];
    //遍历存字典的数组，获得其中的字典（dict），调用字典转模型
    for (NSDictionary *dict in arrayDict) {
        ZWTMessageData *Data = [ZWTMessageData MessageDatawithDict:dict];
        //每获得一个模型，往arrayModel里写入一个模型
        [_arrayModel addObject:Data];
    }
    //将最终的数据复制给不可变数组messageArray
    _messageArray = self.arrayModel;
    }
    return _messageArray;
}
# pragma mark - 加载MessageListTV
///加载MessageListTV
- (void)loadMessageListTV{
//初始化
self.messageListTV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
//设置数据源对象
self.messageListTV.dataSource = self;
//设置代理对象
self.messageListTV.delegate = self;
//添加到父控件
[self.view addSubview:self.messageListTV];
//设置约束
[self.messageListTV mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(44, 0, 49, 0));
}];
}


@end
