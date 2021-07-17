//
//  ZWTCommentVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/7/14.
//

#import "ZWTCommentVC.h"
#import "PrefixHeader.pch"
@interface ZWTCommentVC ()

@end

@implementation ZWTCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化textView
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 80, MAIN_SCREEN_W - 40, 80)];
    //初始化placeholder
    self.placeholder = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 30)];
    self.placeholder.textColor = [UIColor systemGray4Color];
    self.placeholder.text = @"发表你的评论";
    self.textView.delegate = self;
    [self.Fabiao addTarget:self action:@selector(fabiaopinglun) forControlEvents:UIControlEventTouchUpInside];
    [self.textView addSubview:self.placeholder];
    [self.view addSubview:self.textView];
    
}

- (IBAction)cancel:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textView endEditing:YES];
}
#pragma mark - textView代理
- (void)textViewDidChange:(UITextView *)textView{
    //文本为0
    if (textView.text.length == 0) {
        //有placeholder
        self.placeholder.frame = CGRectMake(20, 0, 200, 30);
        self.placeholder.hidden = NO;
        //发布按钮不可用，为灰色
        self.Fabiao.backgroundColor = [UIColor systemGray2Color];
        self.Fabiao.enabled = NO;
    }
    else{
        //发布按钮可用，为绿色
        self.Fabiao.enabled = YES;
        self.Fabiao.backgroundColor = [UIColor systemGreenColor];
        //无placeholder
        self.placeholder.frame = CGRectZero;
    }
}

- (void)fabiaopinglun{
//    NSDictionary *myDictionary = [NSDictionary dictionaryWithObject:self.textView.text forKey:@"comment"];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"fabiaopinglun" object:nil userInfo:myDictionary];
    self.block();
}
@end
