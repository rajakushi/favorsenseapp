//
//  FSReportViewController.h
//  Favorsense
//
//  Created by RAJA JIMSEN on 17/07/18.
//  Copyright © 2018 RAJA JIMSEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FSReportViewController : UIViewController<CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *Submit;
@property (strong, nonatomic) IBOutlet UIButton *Cancel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *reportImageView;
@property (strong, nonatomic) IBOutlet UIImage *reportImage;


- (IBAction)sumbitReportAction:(id)sender;
- (IBAction)cancelReportAction:(id)sender;
- (IBAction)takePhoto:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *cameraButton;

@property (strong, nonatomic) IBOutlet UIButton *SelectCategoryButton;

@property (strong, nonatomic) __block NSString* categoryStr;
@property (strong, nonatomic) __block NSString* reporter;
@property (strong, nonatomic) __block NSString* userId;
@property (strong, nonatomic) __block NSString* latitudeStr;
@property (strong, nonatomic) NSString* longitudeStr;
@property (strong, nonatomic) NSString* addressStr;
@property (strong, nonatomic) __block NSString* country;
@property (strong, nonatomic) NSString* state;
@property (strong, nonatomic) NSString* city;
@property (strong, nonatomic) NSString* postCode;
@property (strong, nonatomic) NSString* imageBaseStr;
@property (strong, nonatomic) NSString* comment;



@end
