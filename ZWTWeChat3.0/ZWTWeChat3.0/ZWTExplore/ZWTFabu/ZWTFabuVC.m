//
//  ZWTFabuVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/22.
//

#import "ZWTFabuVC.h"
#import <Masonry.h>
#import "PrefixHeader.pch"
@interface ZWTFabuVC () <UIScrollViewDelegate,UITextViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *placeholder;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) IBOutlet UIButton *fabuBtn;



@end

@implementation ZWTFabuVC
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fabuBtn.backgroundColor = [UIColor systemGray2Color];
    self.fabuBtn.enabled = NO;
    [self.cancelBtn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    self.scrollView.contentSize = CGSizeMake(MAIN_SCREEN_W, MAIN_SCREEN_H - 53);
    //self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 60, MAIN_SCREEN_W - 40, 160)];
    self.textView.delegate = self;
    [self.scrollView addSubview:self.textView];
    self.placeholder = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 30)];
    self.placeholder.textColor = [UIColor systemGray4Color];
    self.placeholder.text = @"这一刻的想法...";
    [self.textView addSubview:self.placeholder];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(60);
            make.right.left.bottom.offset(0);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.textView endEditing:YES];
}
- (void)textViewDidChange:(UITextView *)textView{
    

    if (textView.text.length == 0) {
        self.placeholder.frame = CGRectMake(20, 0, 200, 30);
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
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}


@end
