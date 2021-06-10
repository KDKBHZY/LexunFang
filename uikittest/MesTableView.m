//
//  MesTableView.m
//  uikittest
//
//  Created by formssi on 2021/6/8.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "MesTableView.h"
#import "MesTableViewCell.h"
@implementation MesTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titlarray = @[@"系统公告",@"乐寻访小乐乐",@"乐寻访小助手"];
        self.textarray = @[@"关于TBC公告",@"非常高兴在乐寻访遇到大家。任何意见",@"乐寻访App使用中任何问题"];

        self.delegate = self;
        self.dataSource = self;
         [self registerNib:[ UINib nibWithNibName:@"MesTableViewCell" bundle:nil ] forCellReuseIdentifier:@"cell1"];
        
            }
    
    return self;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MesTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    cell.textLabel.text = [self.titlarray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"icon"];
    cell.detailTextLabel.text = [self.textarray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlarray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end
