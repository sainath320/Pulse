//
//  Account.m
//  Pulse
//
//  Created by Sainath on 08/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "Account.h"
#import <UIView+Toast.h>

@interface Account ()

@end

@implementation Account

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self shouldAutorotate];
    [self supportedInterfaceOrientation];
    self.welcomeLabel.text=@"Loading";
    [self lineTextField:self.FNTF];
    [self lineTextField:self.LNTF];
    [self lineTextField:self.MNTF];
    [self lineTextField:self.cityTF];
    [self lineTextField:self.stateTF];
    [self lineTextField:self.emailTF];
    [self lineTextField:self.passwordTF];
    [self lineTextField:self.RPTF];
    [self createElements];
    [self shadowForElements:self.subView2];
    [self shadowForElements:self.nameView];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(createLabel) userInfo:nil repeats:NO];
    // Do any additional setup after loading the view.
}


-(void)createElements{

    
    self.stateArray=[[NSMutableArray alloc]initWithObjects:@"",@"AndhraPradesh",@"Telengana",@"TamilNadu",@"Karnataka",@"Kerala",@"Maharastra",@"Orissa",@"Goa",@"Gujarat",@"Punjab",@"Delhi",@"Assam",@"ArunachalPradesh",@"WestBengal",@"Rajastan",@"UttarPradesh",@"Bihar",@"MadhyaPradesh",@"Jammu&&Kashmir",@"Meghalaya",@"HimachalPradesh",@"Haryana",@"Sikkim",@"Tripura",@"Uttarakhand",@"Jharkhand",@"Mizoram",@"Manipur",@"Nagaland",@"Andaman&&Nicobar",@"LaskadWeep",@"Puducherry",@"Daman&Diu",@"Chandigarh",@"Chhatisgarh",@"DadraNagarHaveli", nil];
    

    
    self.statePicker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 100, 334, 90)];
    self.statePicker.delegate=self;
    self.statePicker.dataSource=self;
    self.statePicker.showsSelectionIndicator=YES;
    
   
    
    [self.stateTable setHidden:YES];
    //UIView* dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    self.stateTF.inputView=self.statePicker;
    
    self.FNTF.delegate=self;
    self.LNTF.delegate=self;
    self.MNTF.delegate=self;
    self.cityTF.delegate=self;
    self.stateTF.delegate=self;
    self.emailTF.delegate=self;
    self.passwordTF.delegate=self;
    self.RPTF.delegate=self;
    
    
    [self.checkButton setBackgroundImage:[UIImage imageNamed:@"uncheck.jpeg"] forState:UIControlStateNormal];
    [self.checkButton setBackgroundImage:[UIImage imageNamed:@"check.jpeg"] forState:UIControlStateSelected];
    [self.checkButton setBackgroundImage:[UIImage imageNamed:@"check.jpeg"] forState:UIControlStateHighlighted];
    
    self.checkButton.adjustsImageWhenHighlighted=YES;
    [self.checkButton addTarget:self action:@selector(checkboxSelected:) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFunction)];
    tap.numberOfTapsRequired=1;
    [self.view addGestureRecognizer:tap];
    
}

-(BOOL)shouldAutorotate{
    
    return NO;
}
-(NSInteger)supportedInterfaceOrientation{
    
   // AppDelegate*appdelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    return UIInterfaceOrientationMaskPortrait;
}
-(void)shadowForElements:(UIView*)sender{
    sender.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    sender.layer.shadowColor=[UIColor redColor].CGColor ;
    sender.layer.shadowRadius=7.0f;
    sender.layer.shadowOpacity=3.0f;
    
    UIEdgeInsets edgeInsets=UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath*shadowPath=[UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(sender.bounds, edgeInsets)];
    sender.layer.shadowPath=shadowPath.CGPath;
    sender.preservesSuperviewLayoutMargins=YES;
}

-(void)tapFunction{
    [self.FNTF resignFirstResponder];
    [self.LNTF resignFirstResponder];
    [self.MNTF resignFirstResponder];
    [self.cityTF resignFirstResponder];
    [self.stateTF resignFirstResponder];
    [self.RPTF resignFirstResponder];
    [self.emailTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}


-(void)createLabel{
    
    self.welcomeLabel.backgroundColor=[UIColor brownColor];
    self.welcomeLabel.textColor=[UIColor whiteColor];
        self.welcomeLabel.text=@"Welcome to Brn Family";
    
    NSLog(@"text is %@",self.welcomeLabel.text);
}
-(void)lineTextField:(UITextField*)textField{
    
    self.border=[CALayer layer];
    CGFloat borderWidth= 2;
    self.border.backgroundColor=[UIColor blackColor].CGColor;
    self.border.frame=CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    self.border.borderWidth=borderWidth;
    [textField.layer addSublayer:self.border];
    textField.layer.masksToBounds=YES;
}


-(void)checkboxSelected:(id)sender
{
    self.checkBoxSelected = !self.checkBoxSelected; /* Toggle */
    [self.checkButton setSelected:self.checkBoxSelected];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ([self.stateTF isFirstResponder]) {
        
    
    return self.stateArray.count;
    }
    return YES;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if ([self.stateTF isFirstResponder]) {
        
        return self.stateArray[row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.stateTF.text=self.stateArray[row];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==self.stateTF) {
        self.stateTable.hidden=NO;
    }
    
    
}

-(BOOL)validateMailField:(NSString*)enteredName{
    NSString*expression=@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    NSPredicate*emailText=[NSPredicate predicateWithFormat:@"self Matches%@",expression];
    return [emailText evaluateWithObject:enteredName];
}

-(BOOL)validateNameField:(NSString*)enterName{
    NSString*expression=@".[A-Z a-z]{1,15}+$";
    NSPredicate*emailText=[NSPredicate predicateWithFormat:@"self Matches%@",expression];
    return [emailText evaluateWithObject:enterName];
    
}

-(BOOL)validateMobileField:(NSString*)enterNumber{
    NSString*expression=@"^[7-9][0-9]{9}$";
    NSPredicate*mobileText=[NSPredicate predicateWithFormat:@"self Matches%@",expression];
    return [mobileText evaluateWithObject:enterNumber];
}
-(BOOL)validatePasswordField:(NSString*)enterPassword{
    NSString*expression=@".[A-Z a-z 0-9].{4,10}$";
    NSPredicate*passwordText=[NSPredicate predicateWithFormat:@"self Matches%@",expression];
    return [passwordText evaluateWithObject:enterPassword];
}


-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    bool endEditing=YES;
    if (textField==self.emailTF) {
        if ([self validateMailField:[self.emailTF text ]]==YES) {
            
            
            [self.coutryStack makeToast:@"You Have Enterd Valid Email Credentials" duration:5.0 position:CSToastPositionTop style:nil];
            
            
        }else{
            
            
            [self.coutryStack makeToast:@"You Have Enterd INValid Email Credentials" duration:5.0 position:CSToastPositionTop style:nil];
            
            endEditing=NO;
        }
    }else if (textField==self.FNTF){
        if ([self validateNameField:[self.FNTF text]]==YES) {
            
            [self.nameStack makeToast:@"You Have Entered Valid Name" duration:5.0 position:CSToastPositionCenter style:nil];
            
        }else{
            [self.nameStack makeToast:@"You Have Entered InValid Name" duration:5.0 position:CSToastPositionCenter style:nil];
            
            endEditing=NO;
        }
    }else if (textField==self.LNTF){
        if ([self validateNameField:[self.LNTF text]]==YES) {
            
            [self.nameStack makeToast:@"You Have Entered Valid Name" duration:5.0 position:CSToastPositionCenter style:nil];
            
        }else{
            [self.nameStack makeToast:@"You Have Entered InValid Name" duration:5.0 position:CSToastPositionCenter style:nil];
            
            endEditing=NO;
        }
    }else if (textField==self.MNTF){
        
        if ([self validateMobileField:[self.MNTF text]]==YES) {
            
            [self.coutryStack makeToast:@"You Have Entered Valid Number" duration:5.0 position:CSToastPositionCenter style:nil];
        }else{
            
            [self.coutryStack makeToast:@"You Have Entered InValid Number" duration:5.0 position:CSToastPositionCenter style:nil];
            
            endEditing=NO;
        }
    }else if (textField==self.passwordTF){
        if ([self validatePasswordField:[self.passwordTF text]]==YES) {
            
            
            [self.coutryStack makeToast:@"Your Password Strength is good" duration:4.0 position:CSToastPositionCenter style:nil];
        }
        else{
            
            [self.coutryStack makeToast:@"Password Doesn't Accept Special Characters it only accepts numbers or alphabets" duration:4.0 position:CSToastPositionCenter style:nil];
            self.submit.enabled=NO;
            endEditing=NO;
        }
        
    }else if (textField==self.RPTF){
        if ([self validatePasswordField:[self.RPTF text]]==YES) {
            
            
            [self.coutryStack makeToast:@"Your Password Strength Is Good" duration:4.0 position:CSToastPositionCenter style:nil];
        }
        else{
            
            [self.coutryStack makeToast:@"Your Password Strength Is Low" duration:4.0 position:CSToastPositionCenter style:nil];
            self.submit.enabled=NO;
            endEditing=NO;
        }
        
    }


    
    return endEditing;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField==self.stateTF) {
        
    
    [textField resignFirstResponder];
    self.stateTable.hidden = TRUE;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField==self.stateTF) {
    self.stateTable.hidden = TRUE;
    }
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
    UIImagePickerController*picker=[[UIImagePickerController alloc]init];
    
    picker.delegate=self;
    picker.allowsEditing=YES;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    
    self.imgView.image=image;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)onClickCheck:(id)sender {
}

- (IBAction)onClickBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onClickSubmit:(id)sender {
}
@end
