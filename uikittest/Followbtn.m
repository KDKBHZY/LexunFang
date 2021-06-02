//
//  Followbtn.m
//  uikittest
//
//  Created by formssi on 2021/6/1.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "Followbtn.h"

@implementation Followbtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.typelabel.font = [UIFont systemFontOfSize:8];
        self.numlabel.font = [UIFont systemFontOfSize:6];
        self.typelabel.textAlignment = NSTextAlignmentCenter;
        self.numlabel.textAlignment = NSTextAlignmentCenter;

        self.tintColor = [UIColor blackColor];
        self.numlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 20, 20)];
        self.numlabel.text = @"0";
        [self addSubview:self.numlabel ];
        self.typelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 40, 20)];
        self.typelabel.text = @"获赞";
        [self addSubview:self.typelabel];
    }
    return self;
}
@end
