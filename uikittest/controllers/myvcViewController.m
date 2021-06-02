//
//  myvcViewController.m
//  uikittest
//
//  Created by formssi on 2021/5/12.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "myvcViewController.h"
#import <Masonry/Masonry.h>
#import "MeCollectionViewCell.h"
#import "MeCollectionReusableView.h"
@interface myvcViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation myvcViewController

- (void)viewDidLoad {
    [self setupui];
    self.arr = @[@"",@"我的钱包",@"返利合伙人",@"乐寻互动",@"招聘合伙人",@"我的工具"];
}

-(void) setupui{
    self.scro = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-127)];
    //一定要先添加再用masonry布局
       [self.view addSubview:self.scro];
       [self.scro mas_makeConstraints:^(MASConstraintMaker *make) {
           make.edges.equalTo(self.view);
       }];
       [super viewDidLoad];
       UICollectionViewFlowLayout*layout = [[UICollectionViewFlowLayout alloc] init];
       [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
         
    self.collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -40, self.view.bounds.size.width, 800) collectionViewLayout:layout];
    [self.scro addSubview:self.collectionview];

    self.collectionview.delegate = self;
       self.collectionview.dataSource = self;
        self.collectionview.allowsSelection = YES;
        self.collectionview.backgroundColor = [UIColor whiteColor];
       //注册cell
       [ self.collectionview registerClass:[MeCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
       //注册header
       [ self.collectionview registerClass:[MeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView"];
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MeCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    //分行进行布局
    if(indexPath.section == 0){
        cell.iconimage.image = [UIImage imageNamed:@"icon"];
          cell.gradelabel.backgroundColor = [UIColor lightGrayColor];
        [cell.daybutton setTitle:@"已签0天" forState:UIControlStateNormal];
          cell.daybutton.layer.cornerRadius = 15;
           cell.daybutton.backgroundColor = [UIColor systemYellowColor];
              cell.gradelabel.text = @"信用等级";
           cell.namelabel.text = @"nuorz_9635";
        cell.follow.numlabel.text = @"0";
        cell.follow1.numlabel.text = @"0";
        cell.follow2.numlabel.text = @"0";
        cell.follow3.numlabel.text = @"0";
        cell.follow.typelabel.text = @"获赞";
        cell.follow1.typelabel.text = @"关注";
        cell.follow2.typelabel.text = @"粉丝";
        cell.follow3.typelabel.text = @"收藏";
        UIButton*btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
        [self.collectionview addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
           // make.top.equalTo(cell.follow.mas_bottom).offset(10);
            make.top.mas_equalTo(190);
            make.left.mas_equalTo(10.0);
            make.height.mas_equalTo(64.0);
            make.width.mas_equalTo(self.view.bounds.size.width-20);
        }];
    }
    if (indexPath.section == 1) {
        //整体按钮的位置
        [cell.follow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
        }];
        [cell.follow1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                   make.top.mas_equalTo(10);
            make.left.mas_equalTo(cell.follow.mas_right).offset(70);
               }];
        [cell.follow2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                   make.top.mas_equalTo(10);
            make.left.mas_equalTo(cell.follow1.mas_right).offset(70);

               }];
        
        //使得两个按钮中间对齐
        [cell.follow.typelabel mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.left.mas_equalTo(15);
        make.top.mas_equalTo(25);
               }];
        [cell.follow1.typelabel mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.left.mas_equalTo(10);
        make.top.mas_equalTo(25);
               }];
        [cell.follow2.typelabel mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.left.mas_equalTo(15);
            make.top.mas_equalTo(25);
                   }];
        
         cell.follow.numlabel.text = @"0.00";
               cell.follow1.numlabel.text = @"64";
               cell.follow2.numlabel.text = @"0.00";
        cell.follow.typelabel.text = @"蜂币";
              cell.follow1.typelabel.text = @"引力";
              cell.follow2.typelabel.text = @"蜂金";
        //字体大小
        cell.follow.typelabel.font = [UIFont systemFontOfSize:18];
        cell.follow.numlabel.font = [UIFont systemFontOfSize:18];  cell.follow1.typelabel.font = [UIFont systemFontOfSize:18];
              cell.follow1.numlabel.font = [UIFont systemFontOfSize:18];
        cell.follow2.typelabel.font = [UIFont systemFontOfSize:18];
              cell.follow2.numlabel.font = [UIFont systemFontOfSize:18];

    }
   
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
   
        MeCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView" forIndexPath:indexPath];
     if(indexPath.section==0){
         headerView.frame = CGRectZero;
     }else{
         headerView.titlelabel.text = [self.arr objectAtIndex:indexPath.section];
          headerView.titlelabel.textColor = [UIColor blackColor];

     }

    return headerView;

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger count = 6;
    return count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
            return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 100);

    }
    else{
        return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 190);

    }
}
 

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20.0, 20.0, 40.0, 10.0);
}

// 设定头部标题的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 20);
}




@end
