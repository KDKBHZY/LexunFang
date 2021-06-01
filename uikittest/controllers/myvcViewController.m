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
    self.scro = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-127)];
    
    
    [self.view addSubview:self.scro];
    [self.scro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super viewDidLoad];
    UICollectionViewFlowLayout*layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
      
    UICollectionView *collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -70, self.view.bounds.size.width, 800) collectionViewLayout:layout];
    [self.scro addSubview:collectionview];

    collectionview.delegate = self;
    collectionview.dataSource = self;
    collectionview.allowsSelection = YES;
    collectionview.backgroundColor = [UIColor whiteColor];
    //注册cell
    [collectionview registerClass:[MeCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    //注册header
    [collectionview registerClass:[MeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView"];

}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MeCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.iconimage.image = [UIImage imageNamed:@"img1"];
    
    cell.namelabel.text = @"vdfb";
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
         headerView.titlelabel.text = @"我的";

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
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 190);
}
 

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}

// 设定页眉的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 60);
}




@end
