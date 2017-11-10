//
//  Leave.m
//  Pulse
//
//  Created by Sainath on 08/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "Leave.h"
#import "SWRevealViewController.h"

@interface Leave ()

@end

@implementation Leave

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElements];
    // Do any additional setup after loading the view.
}

-(void)createElements{
    
    [self.menuButton setTarget:self.revealViewController];
    [self.menuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
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

@end
