//
//  ButtonViewController.m
//  uikittest
//
//  Created by formssi on 2021/5/27.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgview  = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.bgview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.bgview];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
