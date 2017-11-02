//
//  AttdenceTable.h
//  Pulse
//
//  Created by Sainath on 01/11/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttdenceTable : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *keyLabel;
@property (weak, nonatomic) IBOutlet UILabel *getLabel;
@property CALayer*sideBorder;
@end
