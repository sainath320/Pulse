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

@interface AttendenceView : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (weak, nonatomic) IBOutlet UITableView *attendenceTable;
@property AppDelegate*AD;
@property NSMutableDictionary*ATDict;
@end
