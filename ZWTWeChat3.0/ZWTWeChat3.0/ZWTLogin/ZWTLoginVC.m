//
//  ZWTLoginVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/19.
//

#import "ZWTLoginVC.h"
#import "ZWTMainTabbarVC.h"
@interface ZWTLoginVC ()


@end

@implementation ZWTLoginVC
#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    
    //判断登录状态 NSUserDefaults
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"LoginStatus"] isEqualToString:@"YES"]) {
        //如果登录状态LoginStatus为YES
        //直接触发登录按钮（动画已关闭）
        [self.loginbtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    //else 登录状态不为YES，需要在登录界面停留
    self.tabBarController.tabBar.hidden = YES;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //登录按钮
    [self.loginbtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

- (void)login{
    //更改登录状态为YES
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"LoginStatus"];
}


@end
