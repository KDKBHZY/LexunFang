//
//  ViewController.m
//  uikittest
//
//  Created by formssi on 2021/5/11.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "ViewController.h"
#import <JMTabBarController.h>
#import "homevc.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

   
    
}
//切换按钮状态
-(void) buttonclic:(UIButton*)btn{
    btn.selected = !btn.selected;
}

//设置控制器

@end
