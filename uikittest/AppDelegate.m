//
//  AppDelegate.m
//  uikittest
//
//  Created by formssi on 2021/5/11.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "zytabbarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //ViewController *view = [[ViewController alloc]init];
    [self.window makeKeyAndVisible];
    //修改tabbar背景色
    [self settabbar];
    return YES;
}


//设置tabbar
-(void) settabbar{
    zytabbarController*tab1 = [[zytabbarController alloc] init];
    [tab1 addchildviewcontrollers];
    [self.window setRootViewController:tab1];

}


@end
