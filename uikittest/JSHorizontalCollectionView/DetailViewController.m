//
//  DetailViewController.m
//  uikittest
//
//  Created by formssi on 2021/6/4.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navititle.title = @"消息";
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    self.iconview.layer.cornerRadius = 30;
    self.iconview.layer.masksToBounds = YES;
    self.followBtn.layer.cornerRadius = 15;
    self.followBtn.backgroundColor = [UIColor systemYellowColor];
     [self.followBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (IBAction)goback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        //NSLog(@"退出成功");
    }];
}


@end
