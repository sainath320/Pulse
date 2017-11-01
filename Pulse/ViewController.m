//
//  ViewController.m
//  Pulse
//
//  Created by Sainath on 23/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElements];
    [self lineTextField:self.emailTF];
    [self lineTextField:self.passwordTF];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createElements{
    self.delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.contentView.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    self.contentView.layer.shadowColor=[UIColor redColor].CGColor ;
    self.contentView.layer.shadowRadius=7.0f;
    self.contentView.layer.shadowOpacity=3.0f;
    self.contentView.layer.shadowPath=[UIBezierPath bezierPathWithRect:self.contentView.bounds].CGPath;
    
    [self.checkBTN setBackgroundImage:[UIImage imageNamed:@"uncheck.jpeg"] forState:UIControlStateNormal];
    [self.checkBTN setBackgroundImage:[UIImage imageNamed:@"check.jpeg"] forState:UIControlStateSelected];
    [self.checkBTN setBackgroundImage:[UIImage imageNamed:@"check.jpeg"] forState:UIControlStateHighlighted];
    
    self.checkBTN.adjustsImageWhenHighlighted=YES;
    [self.checkBTN addTarget:self action:@selector(checkboxSelected:) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFunction)];
    tap.numberOfTapsRequired=1;
    [self.view addGestureRecognizer:tap];
    //[self.loginBtn addGestureRecognizer:tap];
}
-(void)tapFunction{
    
    [self.emailTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

-(void)lineTextField:(UITextField*)textField{
    
    self.border=[CALayer layer];
    CGFloat borderWidth= 2;
    self.border.backgroundColor=[UIColor redColor].CGColor;
    self.border.frame=CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    self.border.borderWidth=borderWidth;
    [textField.layer addSublayer:self.border];
    textField.layer.masksToBounds=YES;
}

-(void)checkboxSelected:(id)sender
{
    self.checkBoxSelected = !self.checkBoxSelected; /* Toggle */
    [self.checkBTN setSelected:self.checkBoxSelected];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onClickLogin:(id)sender {
    
    Singleton*pulse=[Singleton sharedPulse];
    self.string=@"http://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php";
    [pulse serverCommunication:self.string];
    
    NSMutableString*dataString=[NSMutableString stringWithFormat:@"funcName=%@&registeredEmail=%@&registeredPassword=%@",@"verifyLogin",self.emailTF.text,self.passwordTF.text];
    
    NSData*dataPassToServer=[dataString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString*postLength=[NSString stringWithFormat:@"%lu",(unsigned long)[dataPassToServer length]];
    [pulse.urlReq setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [pulse.urlReq setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [pulse.urlReq setHTTPBody:dataPassToServer];
    
    pulse.dataTask=[pulse.session dataTaskWithRequest:pulse.urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data!=nil) {
            
                self.responseDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.delegate.profile=[NSString stringWithFormat:@"%@",[self.responseDict objectForKey:@"profileImagePath"]];
            NSLog(@"PROFILE IS %@",self.delegate.profile);
                NSLog(@"DATA %@",self.responseDict);
            if ([[self.responseDict objectForKey:@"loggedIn"]isEqualToString:@"yes"]) {
                
            dispatch_async(dispatch_get_main_queue(), ^{
                SWRevealViewController*sw=[self.storyboard instantiateViewControllerWithIdentifier:@"reveal"];
                [self presentViewController:sw animated:YES completion:^{
                
                }];
                });
            }
            
            
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"Error" message:@"There is no net connection " preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*action=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            NSLog(@"there isno net");
                });
        }
    }];
    
    [pulse.dataTask resume];
    
    
}
@end
