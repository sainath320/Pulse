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
    [self shadowForElements:self.CNView];
    // Initialization code
}


-(void)shadowForElements:(UIView*)sender{
    
    sender.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
//    if (UIInterfaceOrientationLandscapeLeft) {
//       sender.layer.shadowOffset=CGSizeMake(9.0f, 9.0f);
//    }
    sender.layer.shadowColor=[UIColor whiteColor].CGColor ;
    sender.layer.shadowRadius=5.0f;
    sender.layer.shadowOpacity=1.0f;
    
    UIEdgeInsets edgeInsets=UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath*shadowPath=[UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(sender.bounds, edgeInsets)];
    sender.layer.shadowPath=shadowPath.CGPath;
    sender.preservesSuperviewLayoutMargins=YES;
    
}


     
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
