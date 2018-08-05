//
//  FSRegisterViewController.m
//  Favorsense
//
//  Created by RAJA JIMSEN on 17/07/18.
//  Copyright © 2018 RAJA JIMSEN. All rights reserved.
//

#import "FSRegisterViewController.h"
#import "FSConstnat.h"
#import "FSEnum.h"

@interface FSRegisterViewController ()

@end

@implementation FSRegisterViewController

-(void)viewDidLayoutSubviews
{
    RegisterView.center=CGPointMake(SCREEN_WIDTH/2, (SCREEN_HEIGHT/2)+20);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)RegisterHandler:(id)sender
{
   
    
    NSMutableDictionary *QueryDict=[[NSMutableDictionary alloc]init];
    [QueryDict setObject:@"favorsense" forKey:@"appid"];
    [QueryDict setObject:UsernameTf.text forKey:@"profile_username"];
    [QueryDict setObject:PasswordTf.text forKey:@"profile_password"];
    [QueryDict setObject:EmailTf.text forKey:@"profile_email"];
    
    [HPService HPWebservice:mEnumRegisterURL getJsonDict:QueryDict getView:self];

    
}

#pragma  mark - Login Response

-(void)ReceivedRegisterResponse:(id)sender
{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        NSLog(@"sender %@",sender);
        
        
        if([[sender objectForKey:@"status"]intValue]==-1)
        {
            [HPAlerts ShowMessage:[sender objectForKey:@"message"]];
            return;
        }
        else
        {
            [HPAlerts ShowMessage:[sender objectForKey:@"message"]];

            [self.navigationController popViewControllerAnimated:YES];
        }
        
    });
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
