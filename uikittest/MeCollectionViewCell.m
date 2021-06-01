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
        make.width.mas_equalTo(30);

               make.height.mas_equalTo(30);
        make.top.and.left.mas_equalTo(10.0);
        //make.right.mas_equalTo(-10.0);
      
    }];
    self.iconimage.backgroundColor = [UIColor blueColor];
        self.iconimage.contentMode = UIViewContentModeScaleAspectFit;
    
    self.namelabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.namelabel];
    UIView*currentview = self.iconimage;
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10.0);
        make.left.mas_equalTo(currentview.mas_right);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
        //make.width.mas_equalTo(50);
    }];
    self.namelabel.backgroundColor = [UIColor yellowColor];
}
@end
