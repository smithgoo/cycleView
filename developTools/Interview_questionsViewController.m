//
//  Interview_questionsViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/30.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "Interview_questionsViewController.h"
#import "InfoCollectionViewCell.h"
//#import <QuickLook/QuickLook.h> 
#import "WebViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "math.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface Interview_questionsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate> {


    UICollectionView *collectionView;
//    UIDocumentInteractionController *documentView;
    NSString *path;
    NSInteger rowline;
    
    float random;
    float orign;
    UIButton *start;
   

}

@end

@implementation Interview_questionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-200) collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView setBackgroundColor:[UIColor clearColor]];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"InfoCollectionViewCell"];
    UINib *cellNib =[UINib nibWithNibName:@"InfoCollectionViewCell" bundle:nil];
    [collectionView registerNib:cellNib forCellWithReuseIdentifier:@"identify"];
    [self.view addSubview:collectionView];
    

    
    
    
    
    
//    UILabel *weatherLab =[[UILabel alloc]initWithFrame:CGRectMake(10, collectionView.bottom-100, screenWidth -20, 30)];
//    weatherLab.text = @"模拟抽奖";
//    weatherLab.textColor = [UIColor redColor];
//    weatherLab.textAlignment =NSTextAlignmentCenter;
//    weatherLab.font =[UIFont systemFontOfSize:14];
//    [self.view addSubview:weatherLab];
//    
//    UIImageView *diskImg =[[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-250)/2, weatherLab.bottom, 250, 250)];
//    diskImg.image =[UIImage imageNamed:@"disk"];
//    diskImg.userInteractionEnabled = YES;
//    [self.view addSubview:diskImg];
//    
//    
//    start =[[UIButton alloc]initWithFrame:CGRectMake((250-128)/2, 0, 128, 250)];
//    
////    start. =[UIImage imageNamed:@"start"];
//    [start setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
////    start.userInteractionEnabled = YES;
//    [start addTarget:self action:@selector(clickToStart) forControlEvents:UIControlEventTouchUpInside];
//    [diskImg addSubview:start];
    
//    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickToStart)];
//    [start addGestureRecognizer:tap];

    
    
}
//
//-(void)clickToStart {
//    
//    //******************旋转动画******************
//    //产生随机角度
//    srand((unsigned)time(0));  //不加这句每次产生的随机数不变
//    random = (rand() % 20) / 10.0;
//    //设置动画
//    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    [spin setFromValue:[NSNumber numberWithFloat:M_PI * (0.0+orign)]];
//    [spin setToValue:[NSNumber numberWithFloat:M_PI * (10.0+random+orign)]];
//    [spin setDuration:2.5];
//    [spin setDelegate:self];//设置代理，可以相应animationDidStop:finished:函数，用以弹出提醒框
//    //速度控制器
//    [spin setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    //添加动画
//    [[start layer] addAnimation:spin forKey:nil];
//    //锁定结束位置
//    start.transform = CGAffineTransformMakeRotation(M_PI * (10.0+random+orign));
//    //锁定fromValue的位置
//    orign = 10.0+random+orign;
//    orign = fmodf(orign, 2.0);
//    NSLog(@"%f",orign);
//
//}

/**
 *  动画结束计算角度来判断几等奖
 *
 *  @return 可通过后台定制来特定几等奖
 */
//-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//
//    
//    if () {
//        <#statements#>
//    }
//
//
//
//
//}


-(void)searchTheRoad{

//    self.geoCoder=[[CLGeocoder alloc] init];
//    [self.geoCoder geocodeAddressString:@"" completionHandler:^(NSArray *placemarks, NSError *error) {
//        //地理标注
//        CLPlacemark *clWuHan=placemarks[0];
//        //把地理标注变成地图标注
//        MKPlacemark *mkWuHan=[[MKPlacemark alloc] initWithPlacemark:clWuHan];
//        
//        //把地图标注变成地图项
//        MKMapItem *wuHanItem=[[MKMapItem alloc] initWithPlacemark:mkWuHan];
//        
//        NSDictionary *dict=@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking};
//        
//        //开始导航
//        [MKMapItem openMapsWithItems:@[wuHanItem] launchOptions:dict];
//        
//    }];
    
    NSLog(@"12312");

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {


    return 4;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify =@"identify";
    InfoCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath ];
    
    if (indexPath.row ==0) {
        cell.ttLab.text = @"如何写简历";
        cell.pic.image = [UIImage imageNamed:@"zuojianli"];
    }
    
    if (indexPath.row ==1) {
      
        cell.ttLab.text = @"面试礼仪";
        cell.pic.image = [UIImage imageNamed:@"liyi"];
    }
    if (indexPath.row == 2) {
        cell.ttLab.text = @"ios面试题目";
        cell.pic.image = [UIImage imageNamed:@"mianshi"];
    }
    if (indexPath.row ==3) {
        cell.ttLab.text = @"如何解决bug";
        cell.pic.image = [UIImage imageNamed:@"bug"];
    }
    
  
    
    
    
    return cell;
    
    
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //边距占5*4=20 ，2个
    //图片为正方形，边长：(fDeviceWidth-20)/2-5-5 所以总高(fDeviceWidth-20)/2-5-5 +20+30+5+5 label高20 btn高30 边
    return CGSizeMake(150, 150);
}


//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}


//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

   WebViewController *showView = [[WebViewController alloc]init];
    if (indexPath.row == 0) {
          rowline = 0;
        NSLog(@"点击了第一个");
        showView.indexpath = 0;
        [self.navigationController pushViewController:showView animated:YES];

    }
    if (indexPath.row == 1) {
          rowline = 1;
        NSLog(@"点击了第2个");
        showView.indexpath = 1;
        [self.navigationController pushViewController:showView animated:YES];
    }
    if (indexPath.row == 2) {
          rowline = 2;
        NSLog(@"点击了第3个");
        showView.indexpath = 2;
        [self.navigationController pushViewController:showView animated:YES];
    }

    if (indexPath.row == 3) {
        rowline = 2;
        NSLog(@"点击了第3个");
        showView.indexpath = 3;
        [self.navigationController pushViewController:showView animated:YES];
    }
}


@end
