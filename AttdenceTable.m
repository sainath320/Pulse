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
   // [self labelBorder:self.keyLabel];
   // [self labelBorder:self.getLabel];
    // Initialization code
}


-(void)labelBorder:(UILabel*)label{
    
    self.sideBorder=[CALayer layer];
    self.sideBorder.borderColor = [UIColor redColor].CGColor;
    self.sideBorder.borderWidth = 1;
    self.sideBorder.frame = CGRectMake(0, 0, CGRectGetWidth(label.frame), CGRectGetHeight(label.frame)+2);
    
    [label.layer addSublayer:self.sideBorder];
    label.layer.masksToBounds=YES;
     
    /*
    label.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    label.layer.shadowColor=[UIColor brownColor].CGColor ;
    label.layer.shadowRadius=7.0f;
    label.layer.shadowOpacity=1.0f;
    label.layer.shadowPath=[UIBezierPath bezierPathWithRect:label.bounds].CGPath;
    
    label.layer.masksToBounds=YES;
    label.clipsToBounds=true;
    */
}
     
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
