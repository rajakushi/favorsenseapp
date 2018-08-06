//
//  HPPrefence.m
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import "HPPrefence.h"
#import "FSConstnat.h"

@implementation HPPrefence


+(void) HPsave:(id) userData forKey:(NSString *) key;
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userData];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}


+(id) HPretrieve:(NSString *) key
{
    NSData* data =   [[NSUserDefaults standardUserDefaults] objectForKey:key];
    id value = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return value;
}

+(void)HPStoreString:(NSString*)withObject withKey:(NSString*)key
{
    //withObject = ((withObject ==[NSNull null]) ? @"" :withObject);
    [[NSUserDefaults standardUserDefaults] setObject:withObject forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(NSString*)HPRetrieveString:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void)HPRemove:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(void) HPUserData:(id) userData
{
    
     [[NSUserDefaults standardUserDefaults] setObject:[[[userData objectForKey:@"docs"]objectAtIndex:0] objectForKey:@"userid"] forKey:USER_ID];
    
    [[NSUserDefaults standardUserDefaults] setObject:[[[userData objectForKey:@"docs"]objectAtIndex:0] objectForKey:@"profile_username"] forKey:USER_NAME];
    
    [[NSUserDefaults standardUserDefaults] setObject:[[[userData objectForKey:@"docs"]objectAtIndex:0] objectForKey:@"profile_email"] forKey:USER_EMAIL];
    
     [[NSUserDefaults standardUserDefaults] setObject:[userData objectForKey:@"token"] forKey:USER_TOKEN];
    
    
    
    /*
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"address"] forKey:USER_ADDR];
   
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"image"] forKey:USER_IMAGE];
   // [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"country"] forKey:USER_COUNTRY];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"email"] forKey:USER_EMAIL];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"name"] forKey:USER_NAME];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"phone"] forKey:USER_PHONE];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"age"] forKey:USER_AGE];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"measure"] forKey:USER_MEASURE];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"height"] forKey:USER_HEIGHT];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"weight"] forKey:USER_WEIGHT];
    [[NSUserDefaults standardUserDefaults] setObject:[[userData objectForKey:@"UserInfo"] objectForKey:@"passport"] forKey:USER_PASSPORT];
    [[NSUserDefaults standardUserDefaults]synchronize];
     */
    
}

+(void)KMRemoveAll
{
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];

}


@end
