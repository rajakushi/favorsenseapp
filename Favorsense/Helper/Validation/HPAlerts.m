//
//  HPAlerts.m
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import "HPAlerts.h"

@implementation HPAlerts

+(void)ShowMessage:(NSString*)getMessage{
    
    [RKDropdownAlert title:getMessage time:2];
}




+(void)ShowAlertMessage:(NSString*)getMessage{
    
    UIAlertView *ShowAlert=[[UIAlertView alloc]initWithTitle:@"" message:getMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [ShowAlert show];
    
}



@end
