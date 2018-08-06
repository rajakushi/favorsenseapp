//
//  HPService.m
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import "HPService.h"
#import "HPIndicator.h"
#import "FSEnum.h"
#import "FSConstnat.h"

@implementation HPService

NSString *setRequest;

+(void)HPWebservice:(mKMEnum)EnumType getJsonDict:(NSDictionary*)getRequestDict getView:(UIViewController*)getView
{
    
    if(![HPValidation HPinterNet])
        return;
    
    [HPIndicator StartHPLoading:getView];
    
   
        NSString *getRequest=[self GetJsonFormatFromDictionar:getRequestDict];
        
        setRequest=getRequest;
    
    
    
    
    
    __block NSDictionary *output_Dictionary;
    NSURL *myUrl;
    
    if(EnumType==mEnumLoginURL)
    {
        myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APIURL,@"auth"]];
    }
    else if(EnumType==mEnumRegisterURL)
    {
        myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APIURL,@"signup"]];
    }
    else if (EnumType==mEnumForgotPassword)
    {
        myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APIURL,@"send_email.php"]];
    }
    else if (EnumType == mEnumSendReport)
    {
        myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APIURL,@"report"]];
    }
   
    
    
   
    
    
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:
     myUrl];
    
    
  
        [request setHTTPMethod:@"POST"];
        [request setValue:[NSString
                           stringWithFormat:@"%d", [getRequest length]]
         
       forHTTPHeaderField:@"Content-length"];
    
    
        
        [request setHTTPBody:[getRequest
                              dataUsingEncoding:NSUTF8StringEncoding]];
    
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    if ((EnumType == mEnumSendReport)||(EnumType == mEnumGetReports))
    {
        [request addValue:[[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN] forHTTPHeaderField:@"access-token"];
        
    }
    
    
   
    
    
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                               
                               
                               output_Dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                               
                               NSLog(@"status code %@",output_Dictionary);


                               
                               [HPIndicator StopHPLoading];
                               
                               if (([httpResponse statusCode] == 200) || ([httpResponse statusCode] == 0)) {
                                   
                                   output_Dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                   
                                   
                                   if(EnumType==mEnumLoginURL)
                                   {
                                       [getView performSelectorInBackground:@selector(ReceivedLoginResponse:) withObject:output_Dictionary];
                                   }
                                  
                                   else if(EnumType==mEnumRegisterURL)
                                   {
                                       [getView performSelectorInBackground:@selector(ReceivedRegisterResponse:) withObject:output_Dictionary];
                                   }
                                   else if(EnumType==mEnumSendReport)
                                   {
                                       [getView performSelectorInBackground:@selector(receivedReportResponse:) withObject:output_Dictionary];
                                   }
                                   else if(EnumType==mEnumGetReports)
                                   {
                                       [getView performSelectorInBackground:@selector(ReceivedGetReportResponse:) withObject:output_Dictionary];
                                   }
                                   
                                   else
                                   {
                                       [getView performSelectorInBackground:@selector(ReceivedResponse:) withObject:output_Dictionary];
                                   }
                               }
                               else
                               {
                                   
                                   // [FXTpopMsg ShowMessage:@"Timeout error"];
                                   // [self FXTWebservice:EnumType getRequest:setRequest getView:getView];
                                   
                                  // [self HPWebservice:EnumType getRequest:getRequestDict getView:getView];
                                   
                               }
                               
                               
                               
                           }];
    
    
    
}

+(void)GETWebservice:(mKMEnum)EnumType getView:(UIViewController*)getView QueryUrl:(NSString*)QueryUrl
{
    NSURL *myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",APIURL,@"report?",QueryUrl]];

    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:myUrl];
    [request addValue:[[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN] forHTTPHeaderField:@"access-token"];

    
    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    NSDictionary* jsonResponse = [NSJSONSerialization JSONObjectWithData:oResponseData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSLog(@"--->%@",jsonResponse);
    
    
    
    
    
    
}


+(NSString*)GetJsonFormatFromDictionar:(NSDictionary*)GetDictionary
{
    NSError *error;
    NSString *jsonString=@"";
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:GetDictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
    
}


@end
