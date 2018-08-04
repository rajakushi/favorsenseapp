//
//  FSReportViewController.m
//  Favorsense
//
//  Created by RAJA JIMSEN on 17/07/18.
//  Copyright © 2018 RAJA JIMSEN. All rights reserved.
//

#import "FSReportViewController.h"
#import "UIPopoverListView.h"
#import "FSConstnat.h"
#import "HPService.h"


@import CoreLocation;


@interface FSReportViewController ()<UIPopoverListViewDataSource, UIPopoverListViewDelegate,CLLocationManagerDelegate,UIImagePickerControllerDelegate>
{
    UIPopoverListView *poplistview;
    CLLocation *currentLocation;

    
}
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation FSReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;

    // Do any additional setup after loading the view.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    
}


#pragma mark - ProfileList Spinner

- (IBAction)CategorySpinnerAction:(id)sender
{
    CGFloat xWidth = self.view.bounds.size.width - 20.0f;
    CGFloat yHeight = 295.0f;
    CGFloat yOffset = (self.view.bounds.size.height - yHeight)/2.0f;
    poplistview = [[UIPopoverListView alloc] initWithFrame:CGRectMake(10, yOffset, xWidth, yHeight)];
    poplistview.delegate = self;
    poplistview.datasource = self;
    poplistview.listView.scrollEnabled = TRUE;
    [poplistview setTitle:@"Select Category"];
    poplistview.tag=1;
    [poplistview show];
}


#pragma mark - UIPopoverListViewDataSource

- (UITableViewCell *)popoverListView:(UIPopoverListView *)popoverListView
                    cellForIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:identifier];
    
    
    //  cell.textLabel.text=[NSString stringWithFormat:@"%@ -%@",DeviceEntity.DEVICE_NAME,DeviceEntity.DEVICE_IMEI];
    cell.textLabel.text=[NSString stringWithFormat:@"%@ %i",@"Category",indexPath.row];
   // cell.textLabel.font=UICustomFontComFortRegular(14);
    // cell.textLabel.textColor=[UIColor blueColor];
    cell.backgroundColor=[UIColor whiteColor];
    
    
    return cell;
    
    
}

- (NSInteger)popoverListView:(UIPopoverListView *)popoverListView
       numberOfRowsInSection:(NSInteger)section
{
    
    return 8;
}

#pragma mark - UIPopoverListViewDelegate
- (void)popoverListView:(UIPopoverListView *)popoverListView
     didSelectIndexPath:(NSIndexPath *)indexPath
{
    
    NSString* selectedCategory =[NSString stringWithFormat:@"%@ %i",@"Category",indexPath.row];
    [_SelectCategoryButton setTitle:selectedCategory forState:normal];
}

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView
   heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 50.0f;
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

- (IBAction)sumbitReportAction:(id)sender {
    [self submitReport];
}

- (IBAction)cancelReportAction:(id)sender {
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.reportImageView.image = chosenImage;
    self.reportImage=chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


// Location Manager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
    
    self.locationManager = [locations objectAtIndex:0];
    //[self.locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:self.locationManager completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             _addressStr = [[NSString alloc]initWithString:locatedAt];
             NSString *Area = [[NSString alloc]initWithString:placemark.locality];
             _country = [[NSString alloc]initWithString:placemark.country];
             _city = [NSString stringWithFormat:@"%@, %@", Area,_country];
            // NSLog(@"%@",CountryArea);
             
             _addressLabel.text=_addressStr;
         }
         else
         {
             NSLog(@"Geocode failed with error %@", error);
             NSLog(@"\nCurrent Location Not Detected\n");
             //return;
             //CountryArea = NULL;
         }
     }];

}

-(void)submitReport{
    NSMutableDictionary *QueryDict=[[NSMutableDictionary alloc]init];
    [QueryDict setObject:@"favorsense" forKey:@"appid"];
    //    [QueryDict setObject:UsernameTf.text forKey:@"profile_username"];
    //    [QueryDict setObject:PasswordTf.text forKey:@"profile_password"];
    [QueryDict setObject:@"generalCat" forKey:DATA_CATEGORY];
    [QueryDict setObject:@"manikandan" forKey:DATA_REPORTER];
    [QueryDict setObject:@"manikandan-t" forKey:DATA_USER_ID];

    [QueryDict setObject:@"+37.33233141" forKey:DATA_LAT];

    [QueryDict setObject:@"-122.03121860" forKey:DATA_LNG];

    [QueryDict setObject:@"APPLE" forKey:DATA_ADDRESS];
    [QueryDict setObject:@"USA" forKey:DATA_COUNTRY];
    [QueryDict setObject:@"CA" forKey:DATA_STATE];

    [QueryDict setObject:@"CUPERTIN" forKey:DATA_CITY];

    [QueryDict setObject:@"95014" forKey:DATA_POST_CODE];

    [QueryDict setObject: [self encodeToBase64String:self.reportImage] forKey:DATA_IMAGE];
    //[QueryDict setObject: @"kzlxbsldfjs"forKey:DATA_IMAGE];

    [QueryDict setObject:@"MY FIRST COMMENT" forKey:DATA_COMMENT];

    [HPService HPWebservice:mEnumSendReport getRequest:QueryDict getView:self];


 /*
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
*/
}

- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

-(void)receivedReportResponse:(id)sender
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
            
          /*  UIWindow* window = [UIApplication sharedApplication].keyWindow;
            if (!window) {
                window = [[UIApplication sharedApplication].windows objectAtIndex:0];
            }
            TabBarViewController *tabBarVC = [TabBarViewController new];
            
            window.rootViewController = tabBarVC;
           */
        }
        
        
        
    });
}
@end
