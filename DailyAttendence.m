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
    NSLog(@"MY APP IS %@",self.app.attendenceArray);
    // Do any additional setup after loading the view.
}

-(void)createElements{
    
    self.dailyTable.delegate=self;
    self.dailyTable.dataSource=self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"ARRAY CCCCNY IS %lu",self.app.attendenceArray.count-1);
    return self.app.attendenceArray.count-1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DailyCell*DC=[tableView dequeueReusableCellWithIdentifier:@"daily"];
    if (DC==nil) {
        
        NSArray*xibArray=[[NSBundle mainBundle]loadNibNamed:@"DailyCell" owner:self options:nil];
        DC=[xibArray objectAtIndex:0];
    }
    
    self.keyArray=@[@"attendanceDayCount",@"attendanceDay",@"attendanceDate",@"checkIn",@"checkOut",@"timeSpent",@"shortageExcessTime",@"totalPoints"];
    
    DC.countLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:0]]];
    
    DC.weekLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:1]]];
    
    DC.dateLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:2]]];
    
    DC.checkInLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:3]]];
    
    DC.checkOutLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:4]]];
    
    DC.TSLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:5]]];
    
    DC.SSLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:6]]];
    
    DC.PSLabel.text=[NSString stringWithFormat:@"%@",[[self.app.attendenceArray objectAtIndex:indexPath.row] objectForKey:[self.keyArray objectAtIndex:7]]];
    
    return DC;
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
