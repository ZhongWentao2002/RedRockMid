//
//  FabuController.m
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/7.
//

#import "FabuController.h"

@interface FabuController ()

@end

@implementation FabuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *FabuBtn = [[UIButton alloc]initWithFrame:CGRectMake(250, 10, 58, 20)];

    [FabuBtn setBackgroundImage:[UIImage imageNamed:@"FabuBtn"] forState:UIControlStateNormal];

    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 355, 375, 312)];
    
    iv.image = [UIImage imageNamed:@"Fabu"];
    
    UIButton *Add_image_Btn = [[UIButton alloc]initWithFrame:CGRectMake(36, 171, 97, 95)];
    
    [Add_image_Btn setBackgroundImage:[UIImage imageNamed:@"Add_Image"] forState:UIControlStateNormal];
    
    [self.view addSubview:Add_image_Btn];
    
    [self.view addSubview:iv];
    
    UIBarButtonItem *fabubtn = [[UIBarButtonItem alloc]initWithCustomView:FabuBtn];

    self.navigationItem.rightBarButtonItem = fabubtn;
}



@end
