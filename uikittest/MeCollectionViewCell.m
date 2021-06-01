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
    
    self.namelabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.namelabel];
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10.0);
        make.left.mas_equalTo(self.iconimage.mas_right);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
        //make.width.mas_equalTo(50);
    }];
    self.namelabel.backgroundColor = [UIColor yellowColor];
}
@end
