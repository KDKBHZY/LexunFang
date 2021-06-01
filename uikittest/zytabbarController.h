//
//  zytabbarController.h
//  uikittest
//
//  Created by formssi on 2021/5/14.
//  Copyright © 2021 formssi. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface zytabbarController : UITabBarController
@property(nonatomic,strong) UIButton* centbut;

@property   UIVisualEffectView *bgview;
@property  UIButton*bnt4;
@property  UIButton*bnt3;
@property  UIButton*bnt2;
@property  UIButton*bnt1;

-(void)addchildviewcontrollers;
@end

NS_ASSUME_NONNULL_END
