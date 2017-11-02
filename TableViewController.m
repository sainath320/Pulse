//
//  TableViewController.m
//  Pulse
//
//  Created by Sainath on 26/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "TableViewController.h"
#import "SWRevealViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self shadowViews:self.nameLabel];
    [self shadowViews:self.BIDLabel];
    [self shadowViews:self.SIDLabel];
    [self imageShadow:self.profilePic];
    self.del=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.profilePic.layer.cornerRadius=50.0f;
    self.profilePic.clipsToBounds=true;
    self.profilePic.layer.masksToBounds=YES;
    NSString*string=[self.del.profile stringByReplacingOccurrencesOfString:@".." withString:@"http://www.brninfotech.com/pulse/modules"];
   
    
    
    NSData*data=[NSData dataWithContentsOfURL:[NSURL URLWithString:string]];
    self.profilePic.image=[UIImage imageWithData:data];
    NSLog(@"Image is %@",string);
    NSString*nameString=[self.del.firstName stringByAppendingString:self.del.lastName];
    self.nameLabel.text=nameString;
    NSString*batchString=[@"BatchID:" stringByAppendingString:self.del.batchID];
    self.BIDLabel.text=batchString;
    NSString*studentString=[@"StudentID:" stringByAppendingString:self.del.studentID];
    self.SIDLabel.text=studentString;
    self.menuArray=@[@"Home",@"Create Request",@"Apply Leave",@"Location",@"App Search",@"FeePayment",@"Logout"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)imageShadow:(UIImageView*)imageView{
    imageView.backgroundColor=[UIColor clearColor];
    imageView.layer.shadowOffset=CGSizeMake(5,15);
    imageView.layer.shadowColor=[UIColor redColor].CGColor ;
    imageView.layer.shadowRadius=2.0f;
    imageView.layer.shadowOpacity=0.5;
    imageView.layer.shadowPath=[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:100.0f].CGPath;
    
    
}
-(void)shadowViews:(UILabel*)label

{
    label.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    label.layer.shadowColor=[UIColor colorWithDisplayP3Red:155.0f green:155.0f blue:155.0f alpha:1].CGColor ;
    label.layer.shadowRadius=7.0f;
    label.layer.shadowOpacity=3.0f;
    label.layer.shadowPath=[UIBezierPath bezierPathWithRect:label.bounds].CGPath;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString*cellIdentifier=[self.menuArray objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath*indexPath=[self.tableView indexPathForSelectedRow];
    UINavigationController*destinationViewController=(UINavigationController*)segue.destinationViewController;
    destinationViewController.title=[[self.menuArray objectAtIndex:indexPath.row]capitalizedString];
}


@end
