//
//  xmlViewController.h
//  passvalue
//
//  Created by formssi on 2021/5/26.
//  Copyright © 2021 formssi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface xmlViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *context;
@property NSMutableArray* strarr;
@property NSString* str;
@property dispatch_semaphore_t semaphore;

@end

NS_ASSUME_NONNULL_END
