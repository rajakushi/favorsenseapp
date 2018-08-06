//
//  HPService.h
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HPValidation.h"
#import "HPAlerts.h"
#import "HPPrefence.h"
#import "FSEnum.h"


@interface HPService : NSObject

+(void)HPWebservice:(mKMEnum)EnumType getJsonDict:(NSDictionary*)getRequestDict getView:(UIViewController*)getView;

+(void)GETWebservice:(mKMEnum)EnumType getView:(UIViewController*)getView QueryUrl:(NSString*)QueryUrl;

+(NSString *) getDataFrom:(NSString *)url;

@end
