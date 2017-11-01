//
//  ViewController.h
//  Pulse
//
//  Created by Sainath on 23/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Singleton.h"

@interface ViewController : UIViewController
@property AppDelegate*delegate;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *checkBTN;

@property CALayer*border;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property NSString*string;
@property NSMutableDictionary*responseDict;
- (IBAction)onClickLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property BOOL checkBoxSelected;
@end

