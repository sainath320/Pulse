//
//  Account.h
//  Pulse
//
//  Created by Sainath on 08/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Account : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UITextField *FNTF;
@property (weak, nonatomic) IBOutlet UITextField *LNTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSeg;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)onClickSelect:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *MNTF;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *stateTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *RPTF;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
- (IBAction)onClickCheck:(id)sender;
- (IBAction)onClickBack:(id)sender;
- (IBAction)onClickSubmit:(id)sender;

@end
