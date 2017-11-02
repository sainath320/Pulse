//
//  TableViewController.h
//  Pulse
//
//  Created by Sainath on 26/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <QuartzCore/CALayer.h>

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property AppDelegate*del;
@property (weak, nonatomic) IBOutlet UILabel *BIDLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *SIDLabel;
@property NSArray*menuArray;
@end
