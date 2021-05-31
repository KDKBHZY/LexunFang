//
//  Buttonview.m
//  uikittest
//
//  Created by formssi on 2021/5/27.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "Buttonview.h"

@implementation Buttonview

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView*bgview  = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        bgview.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
        [self addSubview:bgview];
    }
    return self;
}

@end
