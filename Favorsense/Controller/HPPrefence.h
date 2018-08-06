//
//  HPPrefence.h
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPPrefence : NSObject

+(void) HPsave:(id) userData forKey:(NSString *) key;
+(id) HPretrieve:(NSString *) key;

+(void)HPStoreString:(NSString*)withObject withKey:(NSString*)key;
+(NSString*)HPRetrieveString:(NSString*)key;

+(void)KMRemove:(NSString*)key;

+(void)KMRemoveAll;

+(void) HPUserData:(id) userData;

@end
