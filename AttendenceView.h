//
//  AttendenceView.h
//  Pulse
//
//  Created by Sainath on 26/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"
#import "AppDelegate.h"
#import "AttdenceTable.h"
#import "DailyAttendence.h"

@interface AttendenceView : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (weak, nonatomic) IBOutlet UITableView *attendenceTable;
@property AppDelegate*AD;

@property NSArray*atArray;
@property NSArray*keyArray;
@end
