//
//  JSHorizontalCollectionView.m
//  SlidSwitchWIthCollectionView
//
//  Created by Jason on 16/3/11.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "JSHorizontalCollectionView.h"
#import "JSHorizontalTopCollectionViewCell.h"
#import "JSHorizontalBottomCollectionViewCell.h"

@interface JSHorizontalCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

#define TopCollectionViewTag 11111
#define BottomCollectionViewTag 11112

/** 顶部 */
@property (weak, nonatomic) IBOutlet UICollectionView *topCollectionView;
/** title array */
@property (nonatomic, strong) NSArray *titleArray;
/** title Height */
@property (nonatomic, assign) CGFloat titleHeight;
/** 底部 */
@property (weak, nonatomic) IBOutlet UICollectionView *bottomCollectionView;
/** view array */
@property (nonatomic, strong) NSArray *viewArray;
/** view Height */
@property (nonatomic, assign) CGFloat viewHeight;
@property double movex;

/** width */
@property (nonatomic, assign) CGFloat collectionWidth;
@end

@implementation JSHorizontalCollectionView

#define DefinedCollections 4

- (void)awakeFromNib
{
    self.topCollectionView.tag = TopCollectionViewTag;
    self.bottomCollectionView.tag = BottomCollectionViewTag;
    [self.bottomCollectionView addObserver:self forKeyPath:@"scrollx" options:NSKeyValueObservingOptionNew context:NULL];
    //注册cell
    
    [JSHorizontalTopCollectionViewCell registerCellWithCollectionView:self.topCollectionView];
    [JSHorizontalBottomCollectionViewCell registerCellWithCollectionView:self.bottomCollectionView];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    JSHorizontalTopCollectionViewCell*topc = [[JSHorizontalTopCollectionViewCell alloc]init];
    if([keyPath isEqualToString:@"scrollx"]){
    int y = self.bottomCollectionView.contentOffset.y;
        int sum = y%370;
        if(y%370>50){
            topc.lineView.transform= CGAffineTransformMakeTranslation(+sum, 0);
        }
        
    }
}

- (void)layoutSubviews
{
    self.collectionWidth = CGRectGetWidth(self.frame);
    
    self.titleHeight = CGRectGetHeight(self.topCollectionView.frame);
    self.viewHeight = CGRectGetHeight(self.bottomCollectionView.frame);
    
    if (self.titleArray.count > 0) {
        [self.topCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    }
    
}

#pragma mark - datasource & delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger tmpNum = 0;
    switch (collectionView.tag) {
        case TopCollectionViewTag: {
            tmpNum = self.titleArray.count;
            break;
        }
        case BottomCollectionViewTag: {
            tmpNum = self.viewArray.count;
            break;
        }
        default:
            break;
    }
    return tmpNum;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize tmpSize = CGSizeZero;
    switch (collectionView.tag) {
        case TopCollectionViewTag: {
            tmpSize = CGSizeMake(self.collectionWidth / (CGFloat)DefinedCollections, self.titleHeight);
            NSLog(@"titleheight:%f",self.titleHeight);
            break;
        }
        case BottomCollectionViewTag: {
            tmpSize = CGSizeMake(self.collectionWidth, self.viewHeight);
            break;
        }
        default:
            break;
    }
    return tmpSize;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    switch (collectionView.tag) {
        case TopCollectionViewTag: {
            JSHorizontalTopCollectionViewCell *tmpCell = [JSHorizontalTopCollectionViewCell horizontalTopCollectionViewCellWithCollectionView:collectionView forIndexPath:indexPath];
            [tmpCell loadDataWithTitle:self.titleArray[indexPath.item]];
            cell = tmpCell;
            break;
        }
        case BottomCollectionViewTag: {
            JSHorizontalBottomCollectionViewCell *tmpCell = [JSHorizontalBottomCollectionViewCell horizontalBottomCollectionViewCellWithCollectionView:collectionView forIndexPath:indexPath];
            
            [tmpCell loadDataWithView:self.viewArray[indexPath.item]];

            UIColor *color = [UIColor yellowColor];
            if (indexPath.item % 2 == 0) {
                color = [UIColor blueColor];
            }
            tmpCell.backgroundColor = color;
            cell = tmpCell;
            break;
        }
        default:
            break;
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(collectionView.tag == TopCollectionViewTag){
        [self.bottomCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    switch (collectionView.tag) {
//        case TopCollectionViewTag: {
//
//            [self.bottomCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//
//
//            break;
//        }
//        case BottomCollectionViewTag: {
//            break;
//        }
//        default:
//            break;
//    }
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    switch (collectionView.tag) {
//        case TopCollectionViewTag: {
//            JSHorizontalTopCollectionViewCell *cell = (JSHorizontalTopCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//            cell.selected = NO;
//            break;
//        }
//        case BottomCollectionViewTag: {
//            break;
//        }
//        default:
//            break;
//    }
//}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == BottomCollectionViewTag) {
       // NSLog(@"%f",collectionView.contentOffset.x);

            [self.topCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                  cell.selected = YES;
                  [self.topCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];



    }
}

#pragma mark - public

+ (instancetype)horizontalCollectionView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JSHorizontalCollectionView class]) owner:self options:nil] firstObject];
}

+ (instancetype)horizontalCollectionViewWithTitleArray:(NSArray *)titleArray ViewArray:(NSArray *)viewArray
{
    if (titleArray == nil || viewArray == nil
        || titleArray.count == 0 || viewArray.count == 0
        || titleArray.count != viewArray.count) {
        return nil;
    }
    
    JSHorizontalCollectionView *tmpView = [self horizontalCollectionView];
    
    [tmpView setTitleArray:titleArray viewArray:viewArray];
    
    return tmpView;
}

- (void)setTitleArray:(NSArray *)titleArray viewArray:(NSArray *)viewArray
{
    
    if (titleArray == nil || viewArray == nil
        || titleArray.count == 0 || viewArray.count == 0
        || titleArray.count != viewArray.count) {
        return;
    }
    
    self.titleArray = titleArray;
    self.viewArray = viewArray;
    
    [self.topCollectionView reloadData];
    [self.bottomCollectionView reloadData];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.movex = scrollView.contentOffset.x;
   
    
//    [UIView animateWithDuration:1 animations:^{
////        self.topCollectionView.lineView.transform= CGAffineTransformMakeTranslation(100, 0);
//    }];
  }
@end
