//
//  ViewController.h
//  passvalue
//
//  Created by formssi on 2021/5/18.
//  Copyright © 2021 formssi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *searchtext;
@property NSLock*lo;
@property NSLock*lo1;
@property dispatch_semaphore_t semaphore;
@property NSString*name;
@property NSMutableArray* names;
@property NSMutableArray*singers;
@property  NSString*searchname;
@property NSMutableArray*images;
@property NSString*image;
@property int index;
@property (weak, nonatomic) IBOutlet UITableView *tbview;

@end

