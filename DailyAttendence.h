//
//  DailyAttendence.h
//  Pulse
//
//  Created by Sainath on 03/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DailyCell.h"

@interface DailyAttendence : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *dailyTable;
@property AppDelegate*app;
@property NSArray*keyArray;
@property NSArray*fetchedArray;
@end
