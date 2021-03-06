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
      [super viewDidLoad];

    [self setupui];
    self.arr = @[@"",@"我的钱包",@"返利合伙人",@"乐寻互动",@"招聘合伙人",@"我的工具"];
}

-(void) setupui{
//    self.scro = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-127)];
//    //一定要先添加再用masonry布局
//       [self.view addSubview:self.scro];
//       [self.scro mas_makeConstraints:^(MASConstraintMaker *make) {
//           make.edges.equalTo(self.view);
//       }];
       UICollectionViewFlowLayout*layout = [[UICollectionViewFlowLayout alloc] init];
       [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
         
    self.collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 33, self.view.bounds.size.width, 800) collectionViewLayout:layout];
    [self.view addSubview:self.collectionview];

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
    //头像等
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
        [cell addSubview:btn];
        [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell.follow.mas_bottom).offset(5);
            make.left.mas_equalTo(10.0);
            make.height.mas_equalTo(64.0);
            make.width.mas_equalTo(self.view.bounds.size.width-20);
        }];
    }
    
    //我的钱包
    if (indexPath.section == 1) {
       
        //整体按钮的位置
        [cell.follow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
        }];
        //重新布局要用remake
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
    
    //返利合伙人
    if (indexPath.section == 2) {
        [cell.iconimage removeFromSuperview];
             [cell.follow removeFromSuperview];
             [cell.follow1 removeFromSuperview];
             [cell.follow2 removeFromSuperview];
             [cell.follow3 removeFromSuperview];
             [cell.namelabel removeFromSuperview];
             [cell.gradelabel removeFromSuperview];
        [cell.daybutton removeFromSuperview];
     UIButton*btn = [[UIButton alloc] init];
         [btn setImage:[UIImage imageNamed:@"fanli1"] forState:UIControlStateNormal];
        [cell addSubview:btn];
         [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(10);
             make.left.mas_equalTo(20.0);
             make.height.mas_equalTo(64.0);
             make.width.mas_equalTo(64.0);
         }];
        
        UIButton*btn1 = [[UIButton alloc] init];
                [btn1 setImage:[UIImage imageNamed:@"fanli2"] forState:UIControlStateNormal];
               [cell addSubview:btn1];
                [btn1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(10);
                    make.left.mas_equalTo(btn.mas_right).offset(30);
                    make.height.mas_equalTo(64.0);
                    make.width.mas_equalTo(64.0);
                }];
        
    UIButton*btn2 = [[UIButton alloc] init];
            [btn2 setImage:[UIImage imageNamed:@"fanli3"] forState:UIControlStateNormal];
           [cell addSubview:btn2];
            [btn2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(10);
                make.left.mas_equalTo(btn1.mas_right).offset(30);
                make.height.mas_equalTo(64.0);
                make.width.mas_equalTo(64.0);
            }];
        
        UIButton*btn3 = [[UIButton alloc] init];
                [btn3 setImage:[UIImage imageNamed:@"fanli4"] forState:UIControlStateNormal];
               [cell addSubview:btn3];
                [btn3 mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(10);
                    make.left.mas_equalTo(btn2.mas_right).offset(30);
                    make.height.mas_equalTo(64.0);
                    make.width.mas_equalTo(64.0);
                }];
    }
    
    //乐寻互动
    if(indexPath.section == 3){
        [cell.daybutton removeFromSuperview];

        [cell.iconimage removeFromSuperview];
             [cell.follow removeFromSuperview];
             [cell.follow1 removeFromSuperview];
             [cell.follow2 removeFromSuperview];
             [cell.follow3 removeFromSuperview];
             [cell.namelabel removeFromSuperview];
             [cell.gradelabel removeFromSuperview];
        UIButton*btn = [[UIButton alloc] init];
                [btn setImage:[UIImage imageNamed:@"lexun1"] forState:UIControlStateNormal];
               [cell addSubview:btn];
                [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(10);
                    make.left.mas_equalTo(10.0);
                    make.height.mas_equalTo(83.0);
                    make.width.mas_equalTo(170.0);
                }];
               
               UIButton*btn1 = [[UIButton alloc] init];
                       [btn1 setImage:[UIImage imageNamed:@"lexun2"] forState:UIControlStateNormal];
                      [cell addSubview:btn1];
                       [btn1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                           make.top.mas_equalTo(10);
                           make.left.mas_equalTo(btn.mas_right).offset(10);
                          make.height.mas_equalTo(83.0);
                           make.width.mas_equalTo(170.0);
                       }];
               
           UIButton*btn2 = [[UIButton alloc] init];
                   [btn2 setImage:[UIImage imageNamed:@"lexun3"] forState:UIControlStateNormal];
                  [cell addSubview:btn2];
                   [btn2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                       make.top.mas_equalTo(btn.mas_bottom).offset(10);
                       make.left.mas_equalTo(10);
                      make.height.mas_equalTo(83.0);
                       make.width.mas_equalTo(170.0);
                   }];
               
               UIButton*btn3 = [[UIButton alloc] init];
                       [btn3 setImage:[UIImage imageNamed:@"lexun4"] forState:UIControlStateNormal];
                      [cell addSubview:btn3];
                       [btn3 mas_remakeConstraints:^(MASConstraintMaker *make) {
                           make.top.mas_equalTo(btn1.mas_bottom).offset(10);
                           make.left.mas_equalTo(btn2.mas_right).offset(10);
                           make.height.mas_equalTo(83.0);
                           make.width.mas_equalTo(170.0);
                       }];
    }
    
    //招聘合伙人
    if(indexPath.section == 4){
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
                 make.left.mas_equalTo(20.0);
                 make.height.mas_equalTo(64.0);
                 make.width.mas_equalTo(64.0);
             }];
            
            UIButton*btn1 = [[UIButton alloc] init];
                    [btn1 setImage:[UIImage imageNamed:@"zhaopin2"] forState:UIControlStateNormal];
                   [cell addSubview:btn1];
                    [btn1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.top.mas_equalTo(10);
                        make.left.mas_equalTo(btn.mas_right).offset(30);
                        make.height.mas_equalTo(64.0);
                        make.width.mas_equalTo(64.0);
                    }];
            
        UIButton*btn2 = [[UIButton alloc] init];
                [btn2 setImage:[UIImage imageNamed:@"zhaopin3"] forState:UIControlStateNormal];
               [cell addSubview:btn2];
                [btn2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(10);
                    make.left.mas_equalTo(btn1.mas_right).offset(30);
                    make.height.mas_equalTo(64.0);
                    make.width.mas_equalTo(64.0);
                }];
            
            UIButton*btn3 = [[UIButton alloc] init];
                    [btn3 setImage:[UIImage imageNamed:@"zhaopin4"] forState:UIControlStateNormal];
                   [cell addSubview:btn3];
                    [btn3 mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.top.mas_equalTo(10);
                        make.left.mas_equalTo(btn2.mas_right).offset(30);
                        make.height.mas_equalTo(64.0);
                        make.width.mas_equalTo(64.0);
                    }];
    }
    //我的工具
    if (indexPath.section == 5) {
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
                   [btn setImage:[UIImage imageNamed:@"tools"] forState:UIControlStateNormal];
                  [cell addSubview:btn];
                   [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
                       make.top.mas_equalTo(10);
                       make.left.mas_equalTo(20.0);
                       make.height.mas_equalTo(64.0);
                       make.width.mas_equalTo(64.0);
                   }];
                  
                  UIButton*btn1 = [[UIButton alloc] init];
                          [btn1 setImage:[UIImage imageNamed:@"tools2"] forState:UIControlStateNormal];
                         [cell addSubview:btn1];
                          [btn1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                              make.top.mas_equalTo(10);
                              make.left.mas_equalTo(btn.mas_right).offset(30);
                              make.height.mas_equalTo(64.0);
                              make.width.mas_equalTo(64.0);
                          }];
                  
              UIButton*btn2 = [[UIButton alloc] init];
                      [btn2 setImage:[UIImage imageNamed:@"tools3"] forState:UIControlStateNormal];
                     [cell addSubview:btn2];
                      [btn2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                          make.top.mas_equalTo(10);
                          make.left.mas_equalTo(btn1.mas_right).offset(30);
                          make.height.mas_equalTo(64.0);
                          make.width.mas_equalTo(64.0);
                      }];
                  
                  UIButton*btn3 = [[UIButton alloc] init];
                          [btn3 setImage:[UIImage imageNamed:@"tools4"] forState:UIControlStateNormal];
                         [cell addSubview:btn3];
                          [btn3 mas_remakeConstraints:^(MASConstraintMaker *make) {
                              make.top.mas_equalTo(10);
                              make.left.mas_equalTo(btn2.mas_right).offset(30);
                              make.height.mas_equalTo(64.0);
                              make.width.mas_equalTo(64.0);
                          }];
        
        UIButton*btn4 = [[UIButton alloc] init];
                                 [btn4 setImage:[UIImage imageNamed:@"tools5"] forState:UIControlStateNormal];
                                [cell addSubview:btn4];
                                 [btn4 mas_remakeConstraints:^(MASConstraintMaker *make) {
                                     make.top.mas_equalTo(btn.mas_bottom).offset(15);
                                     make.left.mas_equalTo(20);
                                     make.height.mas_equalTo(64.0);
                                     make.width.mas_equalTo(64.0);
                                 }];
        UIButton*btn5 = [[UIButton alloc] init];
                                 [btn5 setImage:[UIImage imageNamed:@"tools6"] forState:UIControlStateNormal];
                                [cell addSubview:btn5];
                                 [btn5 mas_remakeConstraints:^(MASConstraintMaker *make) {
                                     make.top.mas_equalTo(btn1.mas_bottom).offset(15);
                                     make.left.mas_equalTo(btn4.mas_right).offset(30);
                                     make.height.mas_equalTo(64.0);
                                     make.width.mas_equalTo(64.0);
                                 }];
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
     }else if(indexPath.section == 1){
         headerView.titlelabel.text = [self.arr objectAtIndex:indexPath.section];
         headerView.titlelabel.textColor =  [UIColor blackColor];
         
         UILabel * l1 = [[UILabel alloc] init];
         l1.text = @"本月预估收益: 0 蜂金";
         l1.font = [UIFont systemFontOfSize:14];
         l1.textColor = [UIColor lightGrayColor];
         [headerView addSubview:l1];
          [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
              make.right.mas_equalTo(0);
              make.width.mas_equalTo(150);
              make.top.mas_equalTo(1);
         }];
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
    if (indexPath.section == 1 ) {
            return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 60);

    }else if(indexPath.section == 2 || indexPath.section == 4){
        return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 100);

    }
    else if(indexPath.section == 3){
         return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 200);
    }else{
        return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 200);

    }
}
 

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
            return UIEdgeInsetsMake(-29, 20.0, 40.0, 10.0);

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
