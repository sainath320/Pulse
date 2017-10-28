//
//  TableViewController.h
//  Pulse
//
//  Created by Sainath on 26/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property AppDelegate*del;

@property NSArray*menuArray;
@end
