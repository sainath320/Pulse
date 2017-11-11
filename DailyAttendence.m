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
    [self createElements];
    [self shouldAutorotate];
    [self supportedInterfaceOrientation];
    NSLog(@"MY APP IS %@",self.app.attendenceArray);
    // Do any additional setup after loading the view.
}

-(void)createElements{
    
    self.fetchedArray=[[[self.app.attendenceArray reverseObjectEnumerator] allObjects]mutableCopy];
    self.dailyTable.separatorStyle=UITableViewCellStyleValue1;
    self.dailyTable.separatorColor=[UIColor greenColor];
    self.dailyTable.delegate=self;
    self.dailyTable.dataSource=self;
    //self.dailyTable.allowsSelection=NO;

    
}

-(BOOL)shouldAutorotate{
    
    return NO;
}
-(NSInteger)supportedInterfaceOrientation{
    
    // AppDelegate*appdelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    return UIInterfaceOrientationMaskPortrait;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"ARRAY CCCCNY IS %lu",self.app.attendenceArray.count-1);
    return self.app.attendenceArray.count-1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 251;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    return @"👤DailyAttendence";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DailyCell*DC=[tableView dequeueReusableCellWithIdentifier:@"daily"];
    if (DC==nil) {
        
        NSArray*xibArray=[[NSBundle mainBundle]loadNibNamed:@"DailyCell" owner:self options:nil];
        DC=[xibArray objectAtIndex:0];
    }
    
    self.keyArray=@[@"attendanceDayCount",@"attendanceDay",@"attendanceDate",@"checkIn",@"checkOut",@"timeSpent",@"shortageExcessTime",@"totalPoints"];
    
    DC.countLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:0]]];
    
    DC.weekLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:1]]];
    
    DC.dateLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:2]]];
    
    DC.checkInLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:3]]];
    
    DC.checkOutLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:4]]];
    
    DC.TSLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:5]]];
    
    DC.SSLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:6]]];
    
    DC.PSLabel.text=[NSString stringWithFormat:@"%@",[[self.fetchedArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:7]]];
    
    if ([DC.weekLabel.text isEqualToString:@"Sunday"]&&[DC.checkInLabel.text isEqualToString:@""]) {
        DC.weekLabel.backgroundColor=[UIColor orangeColor];
        DC.checkInLabel.hidden=YES;
        DC.checkOutLabel.hidden=YES;
        DC.TSLabel.hidden=YES;
        DC.SSLabel.hidden=YES;
        DC.PSLabel.hidden=YES;
        DC.ciLabel.hidden=YES;
        DC.coLabel.hidden=YES;
        DC.timeLabel.hidden=YES;
        DC.summLabel.hidden=YES;
        DC.pointLabel.hidden=YES;
        DC.displayLabel.hidden=NO;
        DC.displayLabel.text=@"SundayHoliday";
        DC.displayView.backgroundColor=[UIColor orangeColor];
    }
    
    NSInteger points=[DC.PSLabel.text integerValue];
    
    if (points<30&&points==0) {
        DC.checkInLabel.backgroundColor=[UIColor redColor];
        DC.checkOutLabel.backgroundColor=[UIColor redColor];
        DC.TSLabel.backgroundColor=[UIColor redColor];
        DC.SSLabel.backgroundColor=[UIColor redColor];
    }else if (points<30&&points==10){
        
        DC.checkInLabel.backgroundColor=[UIColor redColor];
        
    }else if (points<0){
        DC.checkInLabel.hidden=YES;
        DC.checkOutLabel.hidden=YES;
        DC.TSLabel.hidden=YES;
        DC.SSLabel.hidden=YES;
        DC.PSLabel.hidden=YES;
        DC.ciLabel.hidden=YES;
        DC.coLabel.hidden=YES;
        DC.timeLabel.hidden=YES;
        DC.summLabel.hidden=YES;
        DC.pointLabel.hidden=YES;
        DC.displayLabel.hidden=NO;
        DC.displayLabel.text=@"Absent";
        DC.displayView.backgroundColor=[UIColor redColor];
    }
    return DC;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){
    
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
