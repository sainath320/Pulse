//
//  AttdenceTable.m
//  Pulse
//
//  Created by Sainath on 01/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "AttdenceTable.h"

@implementation AttdenceTable

- (void)awakeFromNib {
    [super awakeFromNib];
    [self labelBorder:self.keyLabel];
    [self labelBorder:self.getLabel];
    // Initialization code
}


-(void)labelBorder:(UILabel*)label{
    
    self.sideBorder=[CALayer layer];
    self.sideBorder.borderColor = [UIColor darkGrayColor].CGColor;
    self.sideBorder.borderWidth = 1;
    self.sideBorder.frame = CGRectMake(-1, -1, CGRectGetWidth(label.frame), CGRectGetHeight(label.frame)+2);
    
    [label.layer addSublayer:self.sideBorder];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
