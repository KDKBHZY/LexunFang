//
//  MeCollectionViewCell.h
//  uikittest
//
//  Created by formssi on 2021/6/1.
//  Copyright © 2021 formssi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Followbtn.h"
NS_ASSUME_NONNULL_BEGIN

@interface MeCollectionViewCell : UICollectionViewCell
@property UIImageView*iconimage;
@property UILabel*namelabel;
@property UILabel*gradelabel;
@property UIButton*daybutton;
@property Followbtn*follow;
@property Followbtn*follow1;
@property Followbtn*follow2;
@property Followbtn*follow3;

@end

NS_ASSUME_NONNULL_END
