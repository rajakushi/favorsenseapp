//
//  FSConstnat.h
//  Favorsense
//
//  Created by RAJA JIMSEN on 18/07/18.
//  Copyright © 2018 RAJA JIMSEN. All rights reserved.
//

#ifndef FSConstnat_h
#define FSConstnat_h


#define SCREEN_WIDTH (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define THEME_CELLCOLOR [UIColor colorWithRed:215.0/255.0 green:215.0/255.0 blue:215.0/255.0 alpha:1.0]


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


#define NoInternet @"Internet connection appears to be offline."

#define APIURL @"http://api.favoriot.com/favorsense/v1/"


#define USER_ID         @"userid"
#define USER_TOKEN      @"token"
#define USER_EMAIL      @"profile_email"
#define USER_NAME       @"profile_username"
#define APP_ID          @"appid"
#define DATA_CATEGORY   @"data_category"
#define DATA_REPORTER   @"data_reporter"
#define DATA_USER_ID    @"data_userid"
#define DATA_LAT        @"data_lat"
#define DATA_LNG        @"data_lng"
#define DATA_ADDRESS    @"data_address"
#define DATA_COUNTRY    @"data_country"
#define DATA_STATE      @"data_state"
#define DATA_CITY       @"data_city"
#define DATA_POST_CODE  @"data_postcode"
#define DATA_IMAGE      @"data_image"
#define DATA_COMMENT    @"data_comment"

/*
 "appid"
 "data_category"
 @"data_reporter"
 @"data_userid"
 @"data_lat"
 @"data_lng"
 @"data_address"
 @"data_country"
 @"data_state"
 @"data_city"
 @"data_postcode"
 @"data_image"
 @"data_comment"
 */

#endif /* FSConstnat_h */
