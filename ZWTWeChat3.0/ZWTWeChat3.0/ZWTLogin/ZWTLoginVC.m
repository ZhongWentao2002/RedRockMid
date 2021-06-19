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

- (void)viewWillAppear:(BOOL)animated{
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"LoginStatus"] isEqualToString:@"YES"]) {
        [self.loginbtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    self.tabBarController.tabBar.hidden = YES;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginbtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)login{
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"LoginStatus"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
