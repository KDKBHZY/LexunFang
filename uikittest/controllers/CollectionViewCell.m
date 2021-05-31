//
//  CollectionViewCell.m
//  uikittest
//
//  Created by formssi on 2021/5/13.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
       
            _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, (UIScreen.mainScreen.bounds.size.width-80)/5, 60)];
        [_btn addTarget:self action:@selector(but) forControlEvents:UIControlEventTouchUpInside];
             // [_btn setTitle:@"外卖" forState:UIControlStateNormal];
        //[btn setBackgroundColor:UIColor.whiteColor];
//        [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
            [self.contentView addSubview:_btn];
    }
  
    return self;
}

-(void) but{
    NSLog(@"点击了");
}


@end
