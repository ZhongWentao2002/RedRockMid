//
//  WeChatViewController.m
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import "WeChatViewController.h"
#import "MessageData.h"
#import "MessageCell.h"


@interface WeChatViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *messageData;
@property (nonatomic,strong) NSMutableArray *arrayModel;
@property (nonatomic,strong) UITableView *messageList;

- (IBAction)test:(id)sender;


@end

@implementation WeChatViewController

- (void)viewDidLoad {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MessageData.plist" ofType:nil];
    NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
    self.arrayModel = [NSMutableArray array];
    for (NSDictionary *dict in arrayDict) {
        //创建模型对象
        MessageData *Data = [MessageData MessageDatawithDict:dict];
        [self.arrayModel addObject:Data];
    }
    self.messageData = self.arrayModel;
    
    
    

    
    
    [super viewDidLoad];
    

    
    
    [self loadMessageList];
    
    

    

    
    
    

    
}
//数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageData.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageData *data = self.messageData[indexPath.row];
    MessageCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:nil options:nil]firstObject];
    cell.contact.text = data.contacts;
    [cell.image setImage:[UIImage imageNamed:data.contactsImage]];
    cell.information.text = data.information;
    cell.time.text = data.time;
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


//加载消息列表
- (void)loadMessageList{
    self.messageList = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 375, 574) style:UITableViewStylePlain];
    self.messageList.dataSource = self;
    self.messageList.delegate = self;
    [self.view addSubview:self.messageList];
}



//    [self.messageList beginUpdates];
//    NSMutableArray *indexPaths = [NSMutableArray array];
//
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:1];
//
//    [indexPaths addObject:indexPath];
//
//    [self.messageList insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
//
//    [self.messageList endUpdates];

- (void)addCell{

}


- (IBAction)test:(id)sender {
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"123",@"contacts",@"456",@"information",@"789",@"time",@"WeChat",@"contactsImage",nil];

    MessageData *Data2 = [MessageData MessageDatawithDict:dict2];

    [self.arrayModel addObject:Data2];

    self.messageData = self.arrayModel;
  
    
    [self.messageList reloadData];
}
@end

