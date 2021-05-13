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

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadcontactsListTV];
}
# pragma mark -contactsListTV的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contactsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZWTContactsData *Data = self.contactsArray[indexPath.row];
    
    ZWTContactsCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ZWTContactsCell" owner:nil options:nil]firstObject];
    
    [cell.image setImage:[UIImage imageNamed:Data.contactImage]];
    cell.name.text = Data.contactName;
    
    return cell;
}
# pragma mark -contactsListTV的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
# pragma mark - 懒加载数据
- (NSArray *)contactsArray{
    if (_contactsArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ZWTContactsData.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            //创建模型对象
            ZWTContactsData *Data = [ZWTContactsData ContactsDatawithDict:dict];
            [arrayModel addObject:Data];
        }
        _contactsArray = arrayModel;
    }
    return _contactsArray;
}
# pragma mark - 加载contactsListTV
///加载contactsListTV
- (void)loadcontactsListTV{
    
    self.contactsListTV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    self.contactsListTV.delegate = self;
    
    self.contactsListTV.dataSource = self;
    
    [self.view addSubview:self.contactsListTV];
    
    [self.contactsListTV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(44, 0, 49, 0));
    }];
}


@end
