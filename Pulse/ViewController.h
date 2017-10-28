//
//  ViewController.h
//  Pulse
//
//  Created by Sainath on 23/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
@property AppDelegate*delegate;
@property (weak, nonatomic) IBOutlet UIView *imgCNV;
@property (weak, nonatomic) IBOutlet UIButton *checkBTN;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property CALayer*border;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property NSURLSession*session;
@property NSMutableURLRequest*req;
@property NSURLSessionDataTask*dataTask;
@property NSMutableDictionary*responseDict;
- (IBAction)onClickLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property BOOL checkBoxSelected;
@end

