//
//  MyTableViewCell.h
//  uikittest
//
//  Created by formssi on 2021/5/25.
//  Copyright © 2021 formssi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nametext;
@property (weak, nonatomic) IBOutlet UILabel *slogan;
@property (weak, nonatomic) IBOutlet UITextView *context;
@property (weak, nonatomic) IBOutlet UIButton *like1;
@property  bool isselecte ;
@property int num;
@end

NS_ASSUME_NONNULL_END
