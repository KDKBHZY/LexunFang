//
//  mesvcViewController.m
//  uikittest
//
//  Created by formssi on 2021/5/12.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "mesvcViewController.h"
#import <Masonry/Masonry.h>
#import "MeCollectionViewCell.h"
#import "MeCollectionReusableView.h"
@interface mesvcViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation mesvcViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINavigationBar*navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 32, UIScreen.mainScreen.bounds.size.width, 44)];
    UINavigationItem*navbartitle = [[UINavigationItem alloc]initWithTitle:@"消息"];
    [navbar pushNavigationItem:navbartitle animated:YES];
    [self.view addSubview:navbar];
    [self setupui];
}
-(void)setupui{
    UICollectionViewFlowLayout*layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
          
     self.collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 78, self.view.bounds.size.width, 800) collectionViewLayout:layout];
     [self.view addSubview:self.collectionview];

     self.collectionview.delegate = self;
        self.collectionview.dataSource = self;
         self.collectionview.allowsSelection = YES;
//         self.collectionview.backgroundColor = [UIColor whiteColor];
    self.collectionview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.08];

        //注册cell
        [ self.collectionview registerClass:[MeCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
      
        //注册header
        [ self.collectionview registerClass:[MeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView"];
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
     MeCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    if(indexPath.section == 0) {
        cell.backgroundColor = [UIColor whiteColor];
           //把不需要的view移除
             [cell.daybutton removeFromSuperview];
             [cell.iconimage removeFromSuperview];
             [cell.follow removeFromSuperview];
             [cell.follow1 removeFromSuperview];
             [cell.follow2 removeFromSuperview];
             [cell.follow3 removeFromSuperview];
             [cell.namelabel removeFromSuperview];
             [cell.gradelabel removeFromSuperview];
             
             UIButton*btn = [[UIButton alloc] init];
                  [btn setImage:[UIImage imageNamed:@"zhaopin1"] forState:UIControlStateNormal];
                 [cell addSubview:btn];
                  [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
                      make.top.mas_equalTo(10);
                      make.left.mas_equalTo(0.0);
                      make.height.mas_equalTo(64.0);
                      make.width.mas_equalTo(64.0);
                  }];
                 
                 UIButton*btn1 = [[UIButton alloc] init];
                         [btn1 setImage:[UIImage imageNamed:@"zhaopin2"] forState:UIControlStateNormal];
                        [cell addSubview:btn1];
                         [btn1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.top.mas_equalTo(10);
                             make.left.mas_equalTo(btn.mas_right).offset(25);
                             make.height.mas_equalTo(64.0);
                             make.width.mas_equalTo(64.0);
                         }];
                 
             UIButton*btn2 = [[UIButton alloc] init];
                     [btn2 setImage:[UIImage imageNamed:@"zhaopin3"] forState:UIControlStateNormal];
                    [cell addSubview:btn2];
                     [btn2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                         make.top.mas_equalTo(10);
                         make.left.mas_equalTo(btn1.mas_right).offset(25);
                         make.height.mas_equalTo(64.0);
                         make.width.mas_equalTo(64.0);
                     }];
                 
                 UIButton*btn3 = [[UIButton alloc] init];
                         [btn3 setImage:[UIImage imageNamed:@"zhaopin4"] forState:UIControlStateNormal];
                        [cell addSubview:btn3];
                         [btn3 mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.top.mas_equalTo(10);
                             make.left.mas_equalTo(btn2.mas_right).offset(25);
                             make.height.mas_equalTo(64.0);
                             make.width.mas_equalTo(64.0);
                         }];
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger count = 2;
    return count;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
   
        MeCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView" forIndexPath:indexPath];
         headerView.frame = CGRectZero;
    

    return headerView;

}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ) {
            return CGSizeMake(UIScreen.mainScreen.bounds.size.width-40, 80);

    }else {
        return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 400);

    }
   
}
 

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
            return UIEdgeInsetsMake(-10, 20.0, 30.0, 20.0);

    }else{
        return UIEdgeInsetsMake(10.0, 20.0, 20.0, 10.0);

    }
}

// 设定头部标题的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 22);
}




@end
