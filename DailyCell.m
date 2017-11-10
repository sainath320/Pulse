//
//  DailyCell.m
//  Pulse
//
//  Created by Sainath on 06/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "DailyCell.h"

@implementation DailyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self shadowForElements:self.cellView];
    [self shouldAutorotate];
    [self supportedInterfaceOrientation];
    // Initialization code
}

-(void)shadowForElements:(UIView*)sender{
    
    sender.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    sender.layer.shadowColor=[UIColor darkGrayColor].CGColor ;
    sender.layer.shadowRadius=7.0f;
    sender.layer.shadowOpacity=3.0f;
    
    UIEdgeInsets edgeInsets=UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath*shadowPath=[UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(sender.bounds, edgeInsets)];
    sender.layer.shadowPath=shadowPath.CGPath;
    sender.preservesSuperviewLayoutMargins=YES;
    
}

-(BOOL)shouldAutorotate{
    
    return NO;
}
-(NSInteger)supportedInterfaceOrientation{
    
    // AppDelegate*appdelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    return UIInterfaceOrientationMaskPortrait;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
