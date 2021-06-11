//
//  homevc.m
//  uikittest
//
//  Created by formssi on 2021/5/12.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "homevc.h"
#import "LoopPlayView.h"
#import "CollectionViewCell.h"
#import "myCollectionViewCell.h"
#include "myCollectionView.h"
#import "MJRefresh.h"
#import "JSHorizontalCollectionView.h"
#import "myableView.h"
@interface homevc ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>

@end

@implementation homevc
#define HCount 5//横向排列个数

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scroview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-127)];
    self.scroview.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    self.scroview.delegate = self;
    self.scroview.contentSize = CGSizeMake(320, 469*3);
    [self.view addSubview:self.scroview];

    //下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestdata];
    }];
    [header setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
     [header setTitle:@"正在刷新数据中..." forState:MJRefreshStateRefreshing];
    [header setLastUpdatedTimeText:^NSString * _Nonnull(NSDate * _Nullable lastUpdatedTime) {
        NSDateFormatter* datef = [[NSDateFormatter alloc] init];
        [datef setDateFormat:@"HH:mm:ss"];
        NSString *now = [datef stringFromDate:lastUpdatedTime];

        NSString* name = [NSString stringWithFormat:@"最后更新: %@",now];
        return  name;
    }];
    self.scroview.mj_header = header;
    [self.scroview.mj_header beginRefreshing];

    [self setupui];
    [self setcollectview];
   
}

-(void) requestdata{
    [self.scroview.mj_header endRefreshing];
}

//页面进行纯代码布局
-(void) setupui{
    UISearchBar*sear = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 0, UIScreen.mainScreen.bounds.size.width-80, 30)];
      sear.placeholder = @"每日答题";
    sear.layer.borderColor = [UIColor whiteColor].CGColor;
    sear.backgroundColor = [UIColor whiteColor];
    //边框宽度
    sear.layer.borderWidth = NO;
      [self.scroview addSubview:sear];
    
    //点击空白回收键盘
    //添加手势
    UITapGestureRecognizer* tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerta:)];
    tap1.delegate = self;
    tap1.numberOfTapsRequired = 1;

    [self.scroview addGestureRecognizer:tap1];
    //添加扫码按钮
      UIImageView*img = [[UIImageView alloc] initWithFrame:CGRectMake(325, 0, 30, 30)];
      img.image = [UIImage imageNamed:@"saoma"];
      [self.scroview addSubview:img];
      
      UIButton*btn = [[UIButton alloc]initWithFrame:CGRectMake(325, 0, 30, 30)] ;
      [btn addTarget:self action:@selector(scan) forControlEvents:UIControlEventTouchUpInside];
      [self.scroview addSubview:btn];
//添加轮播图
      LoopPlayView* lop = [[LoopPlayView alloc] initWithFrame:CGRectMake(20, 40, UIScreen.mainScreen.bounds.size.width-40, 150)];
      lop.isWebImage = NO;
      lop.imageAry = @[@"img1",@"img2",@"img3"];
      [self.scroview addSubview:lop];
    //添加collectionview
    [self setcollectview];
    //添加我的坊区
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
                layout.minimumInteritemSpacing = 20;
                layout.itemSize = CGSizeMake((UIScreen.mainScreen.bounds.size.width-80)/4, 120);
                [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
       //添加我的坊区collectionview
       myCollectionView * myc = [[myCollectionView alloc] initWithFrame:CGRectMake(20, 335, UIScreen.mainScreen.bounds.size.width-40, 100) collectionViewLayout:layout];
        [self.scroview addSubview:[myc headview]];
      [self.scroview addSubview:myc];
    
    NSArray *tmpArray = @[@"坊区", @"推荐", @"关注"];
    
    NSMutableArray *tmpViewArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < tmpArray.count; ++i) {
        //贴scrollview
       myableView *tmpScrollView = [[myableView alloc] initWithFrame:CGRectMake(20, 335, 335, 780)];

        [tmpViewArray addObject:tmpScrollView];
    }
    
    JSHorizontalCollectionView *tmpView = [JSHorizontalCollectionView horizontalCollectionViewWithTitleArray:tmpArray ViewArray:tmpViewArray];
    tmpView.frame = CGRectMake(0, 450, self.view.bounds.size.width, 800);
    [self.scroview addSubview:tmpView];
}

//进行collectionview布局
-(void) setcollectview{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.itemSize = CGSizeMake((UIScreen.mainScreen.bounds.size.width-80)/5, 60);
    //设置滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
  _maincollectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 205, UIScreen.mainScreen.bounds.size.width-40, 60) collectionViewLayout:layout]
    ;
    [self.scroview addSubview:_maincollectionview];
    _maincollectionview.pagingEnabled = YES;

    _maincollectionview.backgroundColor = UIColor.whiteColor;
    //取消滚动条
    _maincollectionview.showsVerticalScrollIndicator = NO;
    _maincollectionview.showsHorizontalScrollIndicator = NO;

    //注册cell
    [self.maincollectionview registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    _maincollectionview.delegate = self;
    _maincollectionview.dataSource = self;
    
    //添加分页控制器
    _pagc = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_maincollectionview.frame), CGRectGetWidth(self.view.frame), 20)];
    _pagc.numberOfPages = 2;
    _pagc.pageIndicatorTintColor = [UIColor grayColor];
    _pagc.currentPageIndicatorTintColor = [UIColor yellowColor];
    [self.scroview addSubview:_pagc];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSString* imgname = [NSString stringWithFormat:@"btn%ld",(long)indexPath.row];
   // NSLog(@"%@",imgname);
    [cell.btn setBackgroundImage:[UIImage imageNamed:imgname] forState:UIControlStateNormal];
    

    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.pagc.numberOfPages * HCount;
}



//每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((UIScreen.mainScreen.bounds.size.width-80)/5, 60);

}

//下标变换
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int x = scrollView.contentOffset.x/CGRectGetWidth(self.maincollectionview.frame);
    self.pagc.currentPage = x;
}

//取消键盘方法
-(void) fingerta:(UITapGestureRecognizer *)gestureRecognizer{
    [self.scroview endEditing:YES];
}
-(void) scan{
    NSLog(@"扫码");
}
//判断点击事件的对象，解决tableview的didselect方法无效的bug
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 输出点击的view的类名
   // NSLog(@"^ 1 1^^%@", NSStringFromClass([touch.view class]));
    
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}


@end
