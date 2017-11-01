//
//  AttendenceView.m
//  Pulse
//
//  Created by Sainath on 26/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "AttendenceView.h"
#import "SWRevealViewController.h"

@interface AttendenceView ()

@end

@implementation AttendenceView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createElements];
    [self getAttendendceDetails];
    // Do any additional setup after loading the view.
}

-(void)createElements{
    
    self.AD=(AppDelegate*)[[UIApplication sharedApplication]delegate];
        
        [self.menuButton setTarget:self.revealViewController];
        [self.menuButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.attendenceTable.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    self.attendenceTable.layer.shadowColor=[UIColor greenColor].CGColor;
    self.attendenceTable.layer.shadowRadius=5.0f;
    self.attendenceTable.layer.shadowOpacity=2.0f;
    self.attendenceTable.layer.shadowPath=[UIBezierPath bezierPathWithRect:self.attendenceTable.bounds].CGPath;
    self.attendenceTable.clipsToBounds=NO;
    self.attendenceTable.layer.masksToBounds=NO;
    
}
-(void)getAttendendceDetails{
    
    Singleton*pulse=[Singleton sharedPulse];
    
    NSString*string2=@"http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php";
    [pulse serverCommunication:string2];
    NSMutableString*serverData=[NSMutableString stringWithFormat:@"funcName=%@",@"getUserAttendance"];
    NSData*dataPass=[serverData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString*postLength=[NSString stringWithFormat:@"%lu",(unsigned long)[dataPass length]];
    
    [pulse.urlReq setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [pulse.urlReq setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [pulse.urlReq setHTTPBody:dataPass];
    
    pulse.dataTask=[pulse.session dataTaskWithRequest:pulse.urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self.AD.attendenceArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.AD.invertedArray=[[[self.AD.attendenceArray reverseObjectEnumerator]allObjects]mutableCopy];
        
        NSLog(@"attdence is _____%@",self.AD.invertedArray);
        NSLog(@"Array count is %lu",(unsigned long)self.AD.attendenceArray.count);
    }];
    [pulse.dataTask resume];
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
