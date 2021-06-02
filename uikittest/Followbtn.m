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
     [ self.typelabel.font fontWithSize:6];
       [ self.numlabel.font fontWithSize:4];
        self.numlabel.font = [UIFont systemFontOfSize:2];
        self.typelabel.font = [UIFont systemFontOfSize:4];
     
        self.typelabel.textAlignment = NSTextAlignmentCenter;
        self.numlabel.textAlignment = NSTextAlignmentCenter;

        self.numlabel.textColor = [UIColor blackColor];
        self.typelabel.textColor = [UIColor lightGrayColor];
        self.numlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 50, 20)];
        self.numlabel.text = @"";
        [self addSubview:self.numlabel ];
        self.typelabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 25, 40, 20)];
        self.typelabel.text = @"";
        [self addSubview:self.typelabel];
    }
    return self;
}
@end
