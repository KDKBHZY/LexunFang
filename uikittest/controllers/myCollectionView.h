//
//  myCollectionView.h
//  uikittest
//
//  Created by formssi on 2021/5/17.
//  Copyright © 2021 formssi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property  UICollectionView* mycollectionview;
@property  UIView* headview;
-(void)setupui:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;
@end

NS_ASSUME_NONNULL_END
