//
//  ZWTPYQVC.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/22.
//

#import "ZWTPYQVC.h"
#import "ZWTFabuVC.h"
#import "MyCollectionViewCell.h"
#import <PhotosUI/PHPicker.h>
@interface ZWTPYQVC ()

@property (strong, nonatomic) IBOutlet UIButton *jumpBtn;
@property (nonatomic,strong) NSMutableArray *photoAry;
@property (nonatomic,strong) UICollectionView *cv;
@end

@implementation ZWTPYQVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    self.photoAry = [[NSMutableArray alloc]initWithCapacity:9];
    [self.photoAry addObject:@"1"];
    [super viewDidLoad];
    [self.jumpBtn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];

}
- (void)jump{
    ZWTFabuVC *FVC = [[ZWTFabuVC alloc]init];
    [self.navigationController pushViewController:FVC animated:YES];
}

@end
