//
//  myCollectionViewCell.m
//  uikittest
//
//  Created by formssi on 2021/5/17.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "myCollectionViewCell.h"

@implementation myCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, (UIScreen.mainScreen.bounds.size.width-40)/4, 90)];
        [_btn addTarget:self action:@selector(but) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_btn];
    }
    return self;
}
-(void) but{
    NSLog(@"my点击了");
}

@end
