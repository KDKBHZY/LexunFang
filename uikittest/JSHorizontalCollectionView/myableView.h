//
//  myableView.h
//  uikittest
//
//  Created by formssi on 2021/5/24.
//  Copyright © 2021 formssi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property NSArray*arr;
@end

NS_ASSUME_NONNULL_END
