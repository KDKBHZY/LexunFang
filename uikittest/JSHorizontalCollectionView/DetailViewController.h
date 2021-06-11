//
//  DetailViewController.h
//  uikittest
//
//  Created by formssi on 2021/6/4.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : ViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *navititle;
@property (weak, nonatomic) IBOutlet UITextView *context;
@property (weak, nonatomic) IBOutlet UIImageView *iconview;
@property (weak, nonatomic) IBOutlet UIImageView *contextimage;
@property (weak, nonatomic) IBOutlet UILabel *contitle;

@end

NS_ASSUME_NONNULL_END
