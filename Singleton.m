//
//  Singleton.m
//  Pulse
//
//  Created by Sainath on 30/10/17.
//  Copyright © 2017 Sainath. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+(id)sharedPulse{
    
    static Singleton*pulse=nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once (&onceToken, ^{
        
        pulse=[[self alloc]init];
        
    });
    
    return pulse;
}

-(instancetype)init{
    
    self=[super init];
    
    if (self) {
        
        NSLog(@"singleton is ready to use");
    }
    
    return self;
}

-(void)serverCommunication:(NSString *)urlString{
    
    self.url=[NSURL URLWithString:urlString];
    self.urlReq=[NSMutableURLRequest requestWithURL:self.url];
    self.urlReq.HTTPMethod=@"POST";
    self.session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

@end
