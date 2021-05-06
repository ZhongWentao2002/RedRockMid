//
//  ContactsViewController.m
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import "ContactsViewController.h"
#import "ContactsData.h"
#import "ContactsCell.h"

@interface ContactsViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *contactsData;
@property (nonatomic,strong) UITableView *contactsList;

@end

@implementation ContactsViewController

- (NSArray *)contactsData{
    if (_contactsData == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ContactsData.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            //创建模型对象
            ContactsData *Data = [ContactsData ContactsDatawithDict:dict];
            [arrayModel addObject:Data];
        }
        _contactsData = arrayModel;
    }
    return _contactsData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contactsList = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 375, 574) style:UITableViewStylePlain];
    self.contactsList.delegate = self;
    self.contactsList.dataSource = self;
    
    [self.view addSubview:self.contactsList];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    MessageData *data = self.messageData[indexPath.row];
//    MessageCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:nil options:nil]firstObject];
//    cell.contact.text = data.contacts;
//    [cell.image setImage:[UIImage imageNamed:data.contactsImage]];
//    cell.information.text = data.information;
//    cell.time.text = data.time;
    
    ContactsData *Data = self.contactsData[indexPath.row];
    
    ContactsCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ContactsCell" owner:nil options:nil]firstObject];
    
    
    [cell.image setImage:[UIImage imageNamed:Data.contactImage]];
    cell.name.text = Data.contactName;
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}


@end
