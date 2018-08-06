//
//  HPIndicator.m
//  HapSeng
//
//  Created by RAJA JIMSEN on 03/03/17.
//  Copyright © 2017 RAJA JIMSEN. All rights reserved.
//

#import "HPIndicator.h"
#import "TYDotIndicatorView.h"
#import "FSConstnat.h"

@implementation HPIndicator

UIViewController *FXTview;
TYDotIndicatorView *squareDot;

+(void)StartHPLoading:(UIViewController*)GetCurrentview
{
    if([squareDot isAnimating])
    {
        [squareDot stopAnimating];
        
    }
    
    FXTview=GetCurrentview;
    
    
    
    squareDot = [[TYDotIndicatorView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2, SCREEN_WIDTH, 50)
                                                 dotStyle:TYDotIndicatorViewStyleCircle
                                                 dotColor:[UIColor blackColor]
                                                  dotSize:CGSizeMake(12, 12)];
    [GetCurrentview.view addSubview:squareDot];
    [squareDot startAnimating];
}



+(void)StopHPLoading
{
    [squareDot stopAnimating];
}

@end
