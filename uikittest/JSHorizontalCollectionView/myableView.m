//
//  myableView.m
//  uikittest
//
//  Created by formssi on 2021/5/24.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "myableView.h"
#import "myTableViewCell.h"
@implementation myableView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         [self registerNib:[ UINib nibWithNibName:@"MyTableViewCell" bundle:nil ] forCellReuseIdentifier:@"mycell"];                self.delegate = self;
              self.dataSource = self;
        //禁止tablevie滚动
        self.scrollEnabled = NO;
        
    }
    return self;
}

//设置一个headerview来使cell有间隔
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}
//设置headerview的高度，也就是cell的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSArray*arr = @[@"btc",@"eth",@"doge",@"ht",@"dot",@"uni"];
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    cell.nametext.text = [arr objectAtIndex:indexPath.section];
    cell.slogan.text = @"翘起地球的动态";
    cell.icon.image = [UIImage imageNamed:@"my1"];
    return cell;;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


@end
