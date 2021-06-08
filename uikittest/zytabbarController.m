//
//  zytabbarController.m
//  uikittest
//
//  Created by formssi on 2021/5/14.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "zytabbarController.h"
#import "homevc.h"
#import "findvcViewController.h"
#import "mesvcViewController.h"
#import "myvcViewController.h"

@interface zytabbarController ()<UITabBarControllerDelegate>

@end

@implementation zytabbarController

- (void)viewDidLoad {
    self.delegate = self;
    [super viewDidLoad];
    //添加遮罩层
    UIImageView*vc = [[UIImageView alloc]initWithFrame:CGRectMake(152, UIScreen.mainScreen.bounds.size.height-self.tabBar.frame.size.height-60, 71, 71)];
    vc.backgroundColor = [UIColor whiteColor];
    //圆角
    vc.layer.cornerRadius = 40;
    [self.view addSubview:vc];
    //添加按钮
    self.centbut = [[UIButton alloc] initWithFrame: CGRectMake(152, UIScreen.mainScreen.bounds.size.height-self.tabBar.frame.size.height-60, 71, 71)];
       //设置图片
       [self.centbut setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
       [self.centbut addTarget:self action:@selector(plusm) forControlEvents:UIControlEventTouchUpInside];
       //去除选择时高亮
       self.centbut.adjustsImageWhenHighlighted = NO;
       
    [self.view addSubview:self.centbut];
    [self addchildviewcontrollers];
  

}

-(void)addchildviewcontrollers{
    NSString*hometitle = NSLocalizedString(@"首页",nil);
    NSString*metitle = NSLocalizedString(@"我的",nil);

    [[UITabBar appearance] setBackgroundColor:UIColor.whiteColor];
       [[UITabBar appearance] setTintColor:UIColor.blackColor ];
         homevc *homevc1 = [[homevc alloc] init];
          [self setupOneChildViewController:homevc1 title:hometitle col:UIColor.whiteColor image:@"Home_normal" selectedImage:@"Home_selected"];
     //  [tab1 addChildViewController:homevc1];
    [self addChildViewController:homevc1];
          findvcViewController* findvc = [[findvcViewController alloc] init];
          [self setupOneChildViewController:findvc title:@"发现" col:UIColor.greenColor image:@"find" selectedImage:@"find_selected"];
       [self addChildViewController:findvc];
       
    homevc * btc = [[ homevc  alloc] init];
             [self setupOneChildViewController:btc title:@"" col:UIColor.greenColor image:@"" selectedImage:@""];
          [self addChildViewController:btc];

         mesvcViewController* mesvc = [[mesvcViewController alloc] init];
          [self setupOneChildViewController:mesvc title:@"消息" col:UIColor.clearColor image:@"message" selectedImage:@"message_selected"];
       [self addChildViewController:mesvc];

          myvcViewController* myvc = [[myvcViewController alloc] init];
          [self setupOneChildViewController:myvc title:metitle col:UIColor.whiteColor image:@"wd" selectedImage:@"wd_selected"];
       [self addChildViewController:myvc];
       //[self.window setRootViewController:tab];

}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title col:(UIColor*) col image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.view.backgroundColor = col;
    
    vc.tabBarItem.title = title;
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
  
}
//按钮方法
-(void)plusm{
    //添加按钮背景虚化
       UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterial];
       self.bgview  = [[UIVisualEffectView alloc] initWithEffect:blur];
    self.bgview.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.height, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
       self.bgview.alpha = 1.0;
    UIButton*bntplus = [[UIButton alloc ] initWithFrame:CGRectMake(152, UIScreen.mainScreen.bounds.size.height-self.tabBar.frame.size.height-20, 71, 71)];
       [bntplus setImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
       bntplus.imageView.layer.cornerRadius = 30;
    [bntplus addTarget:self action:@selector(back)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bgview];
    [self.bgview.contentView addSubview:bntplus];

    //调用动画
    [self btnclickani:YES];
    
    UITapGestureRecognizer*cli = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [self.bgview addGestureRecognizer:cli];
    //NSLog(@"plus方法");
}

-(void)back{
      
                 
                 [UIView animateWithDuration:0.2 animations:^{
                         self.bnt4.frame =CGRectMake(290, UIScreen.mainScreen.bounds.size.height+100, 60,60);

                     //第二个
                          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                              [UIView animateWithDuration:0.2 animations:^{
                                  self.bnt3.frame =CGRectMake(200, UIScreen.mainScreen.bounds.size.height+100, 60,60);

                              }];
                              
                          });
                     //第三个
                          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                              [UIView animateWithDuration:0.2 animations:^{
                                  
                                  self.bnt2.frame =CGRectMake(110, UIScreen.mainScreen.bounds.size.height+190, 60,60);
                               
                              }];
                              
                          });
                             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                      [UIView animateWithDuration:0.2 animations:^{
                                         
                                          self.bnt1.frame = CGRectMake(20, UIScreen.mainScreen.bounds.size.height, 60,60);
                                          
                                             

                                           
                                      }];
                                      
                                  });
                     //最后一个view
                     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                             [UIView animateWithDuration:0.2 animations:^{
                                                 self.bgview.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.height+100, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
                         }];
                     });
                      
                 }];
                 
            
                     
}
//点击按钮弹出动画
-(void)btnclickani:(bool) isse{
    self.bnt1 = [[UIButton alloc ] initWithFrame:CGRectMake(20, UIScreen.mainScreen.bounds.size.height, 30, 30)];
    [self.bnt1 setImage:[UIImage imageNamed:@"star-fill"] forState:UIControlStateNormal];
   self.bnt1.imageView.layer.cornerRadius = 30;
    
    self.bnt2 = [[UIButton alloc ] initWithFrame:CGRectMake(110, UIScreen.mainScreen.bounds.size.height, 30, 30)];
       [self.bnt2 setImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
    self.bnt2.imageView.layer.cornerRadius = 30;

    self.bnt3 = [[UIButton alloc ] initWithFrame:CGRectMake(200, UIScreen.mainScreen.bounds.size.height, 30, 30)];
       [self.bnt3 setImage:[UIImage imageNamed:@"crown (1)"] forState:UIControlStateNormal];
   self.bnt3.imageView.layer.cornerRadius = 30;

    self.bnt4 = [[UIButton alloc ] initWithFrame:CGRectMake(290, UIScreen.mainScreen.bounds.size.height, 30, 30)];
    [self.bnt4 setImage:[UIImage imageNamed:@"Personal Center on"] forState:UIControlStateNormal];
    self.bnt4.imageView.layer.cornerRadius = 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.bgview.frame = UIScreen.mainScreen.bounds;
        //第一个
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.2 animations:^{
              
                   self.bnt1.frame = CGRectMake(20, 600, 60,60);
                    [self.bgview.contentView addSubview:self.bnt1];
                
                 
            }];
            
        });
        //第二个
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [UIView animateWithDuration:0.2 animations:^{
                   
                        self.bnt2.frame = CGRectMake(110, 600, 60,60);
                         [self.bgview.contentView addSubview:self.bnt2];
                     
                      
                 }];
                 
             });
        //第三个
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [UIView animateWithDuration:0.2 animations:^{
                  
                       self.bnt3.frame = CGRectMake(200, 600, 60,60);
                         [self.bgview.contentView addSubview:self.bnt3];
                   
                      
                 }];
                 
             });
        //第四个
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [UIView animateWithDuration:0.2 animations:^{

                         self.bnt4.frame = CGRectMake(290, 600, 60,60);
                         [self.bgview.contentView addSubview:self.bnt4];
                     
                      
                 }];
                 
             });
        
    }];
    
}

@end
