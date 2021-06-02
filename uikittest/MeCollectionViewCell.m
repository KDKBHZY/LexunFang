//
//  MeCollectionViewCell.m
//  uikittest
//
//  Created by formssi on 2021/6/1.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "MeCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation MeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor redColor].CGColor;
        [self setupui];
    }
    return self;
}

-(void) setupui{
    //头像框
    self.iconimage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconimage];
    [self.iconimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);

               make.height.mas_equalTo(80);
        make.top.and.left.mas_equalTo(10.0);
       
    }];
    //必须添加这个属性才可以圆角
    self.iconimage.layer.masksToBounds = YES;
    self.iconimage.layer.cornerRadius = 40 ;
    
    //用户名标签
    self.namelabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.namelabel];
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20.0);
        make.left.mas_equalTo(self.iconimage.mas_right).offset(10);
        
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(150);
    }];
    self.namelabel.font = [UIFont systemFontOfSize:20];
    
    //等级标签
    self.gradelabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.gradelabel];
    [self.gradelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.namelabel.mas_bottom).offset(20);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(self.iconimage.mas_right).offset(10);

               make.width.mas_equalTo(70);
        
    }];
    self.gradelabel.font = [UIFont systemFontOfSize:12];
   
    self.gradelabel.textColor = [UIColor whiteColor];
    self.gradelabel.textAlignment = NSTextAlignmentCenter;
    self.gradelabel.layer.cornerRadius = 10;
    self.gradelabel.layer.masksToBounds = YES;
    
    //签到按钮
    self.daybutton = [[UIButton alloc] init];
    [self.contentView addSubview:self.daybutton];
    [self.daybutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    self.daybutton.tintColor = [UIColor blackColor];
    
    //添加相关
    self.follow = [[Followbtn alloc] init];
    [self.contentView addSubview:self.follow];
    [self.follow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gradelabel.mas_bottom).offset(20);
 make.left.mas_equalTo(self.iconimage.mas_right).offset(-50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
     self.follow1 = [[Followbtn alloc] init];
       [self.contentView addSubview:self.follow1];
       [self.follow1 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.gradelabel.mas_bottom).offset(20);
    make.left.mas_equalTo(self.follow.mas_right).offset(40);
           make.width.mas_equalTo(50);
           make.height.mas_equalTo(50);
       }];
    self.follow1.typelabel.text = @"关注";

    
     self.follow2 = [[Followbtn alloc] init];
       [self.contentView addSubview:self.follow2];
       [self.follow2 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.gradelabel.mas_bottom).offset(20);
    make.left.mas_equalTo(self.follow1.mas_right).offset(40);
           make.width.mas_equalTo(50);
           make.height.mas_equalTo(50);
       }];
    self.follow2.typelabel.text = @"粉丝";
    
     self.follow3 = [[Followbtn alloc] init];
       [self.contentView addSubview:self.follow3];
       [self.follow3 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.gradelabel.mas_bottom).offset(20);
    make.left.mas_equalTo(self.follow2.mas_right).offset(40);
           make.width.mas_equalTo(50);
           make.height.mas_equalTo(50);
       }];
    self.follow3.typelabel.text = @"收藏";

}
@end
