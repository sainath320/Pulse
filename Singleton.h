//
//  Singleton.h
//  Pulse
//
//  Created by Sainath on 30/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

+(id)sharedPulse;
-(void)serverCommunication:(NSString*)urlString;

@property NSURLSession*session;
@property NSURL*url;
@property NSMutableURLRequest*urlReq;
@property NSURLSessionDataTask*dataTask;


@end
