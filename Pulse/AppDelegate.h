//
//  AppDelegate.h
//  Pulse
//
//  Created by Sainath on 23/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property (strong, nonatomic) UIWindow *window;
@property NSString*profile;
@property NSMutableArray*attendenceArray;
@property NSMutableArray*invertedArray;

@end

