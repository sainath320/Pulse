//
//  AppDelegate.m
//  Pulse
//
//  Created by Sainath on 23/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIImage*image=[UIImage imageNamed:@"brn.jpg"];
    UIImageView*imgView=[[UIImageView alloc]initWithImage:image];
    imgView.frame=[[UIScreen mainScreen]bounds];
    imgView.autoresizingMask=UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [self.window.rootViewController.view addSubview:imgView];
    [self.window.rootViewController.view bringSubviewToFront:imgView];
    [UIView animateWithDuration:3.5f delay:2.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imgView.alpha=.0f;
        CGFloat x=-60.0f;
        CGFloat y=-120.0f;
        imgView.frame=CGRectMake(x, y, imgView.frame.size.width-2*x, imgView.frame.size.height-2*y);
    } completion:^(BOOL finished) {
        if (finished) {
            [imgView removeFromSuperview];
        }
    }];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
