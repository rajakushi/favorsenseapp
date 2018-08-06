//
//  HPValidation.m
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import "HPValidation.h"
#import "GCNetworkReachability.h"
#import "HPAlerts.h"
#import "FSConstnat.h"

@implementation HPValidation

+(BOOL)HPinterNet
{
    GCNetworkReachability *reachability;
    reachability = [GCNetworkReachability reachabilityForInternetConnection];
    
    if([reachability isReachable])
    {
        return YES;
    }
    else
    {
        [HPAlerts ShowMessage:NoInternet];
        return NO;
    }
}


@end
