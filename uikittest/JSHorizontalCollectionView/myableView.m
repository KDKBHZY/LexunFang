//
//  myableView.m
//  uikittest
//
//  Created by formssi on 2021/5/24.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "myableView.h"
#import "myTableViewCell.h"
#import "DetailViewController.h"
@implementation myableView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         [self registerNib:[ UINib nibWithNibName:@"MyTableViewCell" bundle:nil ] forCellReuseIdentifier:@"mycell"];
       // self.delegate = self;
              self.dataSource = self;
        //禁止tablevie滚动
        self.scrollEnabled = NO;
        self.allowsSelection = YES;
        self.allowsSelectionDuringEditing = YES;
        self.arr = @[@"btc",@"eth",@"doge",@"ht",@"dot",@"uni"];

    }
    return self;
}

//设置一个headerview来使cell有间隔


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    cell.nametext.text = [self.arr objectAtIndex:indexPath.section];
    cell.slogan.text = @"翘起地球的动态";
    cell.icon.image = [UIImage imageNamed:@"my1"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


@end
