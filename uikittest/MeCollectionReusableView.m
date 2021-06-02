//
//  MeCollectionReusableView.m
//  uikittest
//
//  Created by formssi on 2021/6/1.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "MeCollectionReusableView.h"
#import <Masonry/Masonry.h>
@implementation MeCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupui];
    }
    return self;
}

-(void) setupui{
    self.titlelabel = [[UILabel alloc] init];
    [self addSubview:self.titlelabel];

    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(0);
        make.left.mas_equalTo(10.0);
    }];
    self.titlelabel.textAlignment = NSTextAlignmentLeft;
    self.titlelabel.textColor = [UIColor blackColor];
}
@end
