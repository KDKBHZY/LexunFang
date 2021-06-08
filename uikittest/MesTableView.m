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
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[MesTableViewCell class] forCellReuseIdentifier:@"cell"];
            }
    
    return self;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"消息";
    cell.imageView.image = [UIImage imageNamed:@"icon"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


@end
