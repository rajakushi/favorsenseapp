//
//  FSLoginViewController.m
//  Favorsense
//
//  Created by RAJA JIMSEN on 17/07/18.
//  Copyright © 2018 RAJA JIMSEN. All rights reserved.
//

#import "FSLoginViewController.h"
#import "TabBarViewController.h"
#import "FSConstnat.h"
#import "HPService.h"
#import "HPAlerts.h"
#import "HPPrefence.h"


@interface FSLoginViewController ()

@end

@implementation FSLoginViewController

-(void)viewDidLayoutSubviews
{
    LoginView.center=CGPointMake(SCREEN_WIDTH/2, (SCREEN_HEIGHT/2)+20);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    
    

    // Do any additional setup after loading the view.
}

-(IBAction)LoginHandler:(id)sender
{
    
    NSMutableDictionary *QueryDict=[[NSMutableDictionary alloc]init];
    [QueryDict setObject:@"favorsense" forKey:@"appid"];
//    [QueryDict setObject:UsernameTf.text forKey:@"profile_username"];
//    [QueryDict setObject:PasswordTf.text forKey:@"profile_password"];
    [QueryDict setObject:@"manikandan-t" forKey:@"profile_username"];
    [QueryDict setObject:@"9095588528" forKey:@"profile_password"];

    
    [HPService HPWebservice:mEnumLoginURL getRequest:QueryDict getView:self];
    
    
    /*
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    TabBarViewController *tabBarVC = [TabBarViewController new];
    
    window.rootViewController = tabBarVC;
     */
}


-(void)ReceivedLoginResponse:(id)sender
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
            [HPPrefence HPUserData:sender];
            
            UIWindow* window = [UIApplication sharedApplication].keyWindow;
            if (!window) {
                window = [[UIApplication sharedApplication].windows objectAtIndex:0];
            }
            TabBarViewController *tabBarVC = [TabBarViewController new];
            
            window.rootViewController = tabBarVC;
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
