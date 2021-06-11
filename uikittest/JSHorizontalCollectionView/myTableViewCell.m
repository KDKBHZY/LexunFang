//
//  MyTableViewCell.m
//  uikittest
//
//  Created by formssi on 2021/5/25.
//  Copyright © 2021 formssi. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.isselecte = NO;
    [self.like1.titleLabel setTintColor:[UIColor grayColor]];
   // self.num = (int)self.like1.currentTitle;
    self.num = 10;

   // NSLog(@"%@",[NSString stringWithFormat:@"%@",self.like1.currentAttributedTitle ]);
}
- (IBAction)like:(id)sender {
     
    self.isselecte = !self.isselecte;
    if(self.isselecte == YES){
    [self.like1 setImage:[UIImage imageNamed:@"star_selected"] forState:UIControlStateNormal];
        self.num+=1;
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d",self.num]];
        [self.like1 setAttributedTitle:attriString forState:UIControlStateNormal];
    }else{
        [self.like1 setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
        self.num-=1;
               NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d",self.num]];
             
               [self.like1 setAttributedTitle:attriString forState:UIControlStateNormal];
    }
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
