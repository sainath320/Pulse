//
//  DailyAttendence.m
//  Pulse
//
//  Created by Sainath on 03/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "DailyAttendence.h"

@interface DailyAttendence ()

@end

@implementation DailyAttendence

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSLog(@"MY APP IS %@",self.app.attendenceArray);
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

@end
