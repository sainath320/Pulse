//
//  DailyCell.h
//  Pulse
//
//  Created by Sainath on 06/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkInLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkOutLabel;
@property (weak, nonatomic) IBOutlet UILabel *TSLabel;
@property (weak, nonatomic) IBOutlet UILabel *SSLabel;
@property (weak, nonatomic) IBOutlet UILabel *PSLabel;
@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *ciLabel;
@property (weak, nonatomic) IBOutlet UILabel *coLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *summLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;

@end
