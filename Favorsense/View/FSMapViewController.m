//
//  FSMapViewController.m
//  Favorsense
//
//  Created by RAJA JIMSEN on 17/07/18.
//  Copyright © 2018 RAJA JIMSEN. All rights reserved.
//

#import "FSMapViewController.h"
#import "MapPopView.h"

@interface FSMapViewController ()

@end

@implementation FSMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
