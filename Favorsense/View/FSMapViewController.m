//
//  FSMapViewController.m
//  Favorsense
//
//  Created by RAJA JIMSEN on 17/07/18.
//  Copyright © 2018 RAJA JIMSEN. All rights reserved.
//

#import "FSMapViewController.h"
#import "MapPopView.h"
#import "HPService.h"
#import "FSConstnat.h"
#import "HPPrefence.h"

@interface FSMapViewController ()

@end

@implementation FSMapViewController

-(void)viewWillAppear:(BOOL)animated
{
    NSString *passquery=[NSString stringWithFormat:@"data_userid=%@",[HPPrefence HPRetrieveString:USER_ID]];

   // [HPService HPWebservice:mEnumGetReports getJsonDict:nil getQueryStr:passquery getView:self HttpMethod:HTTP_GET];
    
 //   NSLog(@"--->%@",    [HPService getDataFrom:@"http://api.favoriot.com/favorsense/v1/report?data_userid=6549674b-6915-4eef-9769-968c9a7d2e43"]);

    [HPService GETWebservice:mEnumGetReports getView:self QueryUrl:passquery];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    


    // Do any additional setup after loading the view.
}

#pragma mark - Server Response

-(void)ReceivedGetReportResponse:(id)sender
{
    NSLog(@"---->%@",sender);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)MapPopUpHandler:(id)sender
{
    NSBundle* frameworkBundle = [NSBundle bundleForClass:[self class]];
    MapPopView *csView = [[frameworkBundle loadNibNamed:@"MapPopView" owner:self options:nil] firstObject];
    csView.backgroundColor=[UIColor whiteColor];
    csView.frame = CGRectMake(30, 90, 262, 460);
    [self.view addSubview:csView];
    
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
