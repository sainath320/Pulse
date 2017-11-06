//
//  DailyAttendence.h
//  Pulse
//
//  Created by Sainath on 03/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface DailyAttendence : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *dailyTable;
@property AppDelegate*app;

@end
