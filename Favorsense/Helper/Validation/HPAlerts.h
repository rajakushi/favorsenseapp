//
//  HPAlerts.h
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKDropdownAlert.h"

@interface HPAlerts : NSObject<RKDropdownAlertDelegate>

+(void)ShowMessage:(NSString*)getMessage;

+(void)ShowAlertMessage:(NSString*)getMessage;

@end
