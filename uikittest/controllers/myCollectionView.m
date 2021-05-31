//
//  myCollectionView.m
//  uikittest
//
//  Created by formssi on 2021/5/17.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "myCollectionView.h"
#import "myCollectionViewCell.h"
@implementation myCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
     
        [self setupui:frame collectionViewLayout:layout];
        self.backgroundColor = [UIColor whiteColor];
                   //取消滚动条
                 self.showsVerticalScrollIndicator = NO;
                 self.showsHorizontalScrollIndicator = NO;
                 
                   //注册cell
               [self registerClass:[myCollectionViewCell class] forCellWithReuseIdentifier:@"newcell"];
                self.delegate = self;
               self.dataSource = self;
    }
    return self;
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
 myCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"newcell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
     NSString* imgname = [NSString stringWithFormat:@"my%ld",(long)indexPath.row];
    // NSLog(@"%@",imgname);
     [cell.btn setBackgroundImage:[UIImage imageNamed:imgname] forState:UIControlStateNormal];
     return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((UIScreen.mainScreen.bounds.size.width-40)/4, 90);

}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
       return 60.0f;
}

//collectionview标题
-(void)setupui:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
           
            _headview = [[UIView alloc] initWithFrame:CGRectMake(20,280, 0, 80)];
            _headview.backgroundColor = [UIColor redColor];
             UILabel*la = [[UILabel alloc] initWithFrame:CGRectMake(0,10, 130, 50)];
                    la.text = @"我的坊区";
                    la.textColor = [UIColor blackColor];
            la.font = [UIFont systemFontOfSize:18];
            UIButton *more = [[UIButton alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width-110, 30, 70, 20)];
    more.font= [UIFont systemFontOfSize:12];
    more.layer.borderWidth = 0.1;
    more.layer.cornerRadius = 20;
            [more setTitle:@"查看更多" forState:UIControlStateNormal];
            [more setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_headview addSubview:la];
            [_headview addSubview:more];
          
}







@end
