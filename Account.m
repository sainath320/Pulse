//
//  Account.m
//  Pulse
//
//  Created by Sainath on 08/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "Account.h"

@interface Account ()

@end

@implementation Account

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onClickSelect:(id)sender {
}
- (IBAction)onClickCheck:(id)sender {
}

- (IBAction)onClickBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onClickSubmit:(id)sender {
}
@end
