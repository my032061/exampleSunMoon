//
//  ViewController.m
//  exampleSunMoon
//
//  Created by YamashitaMasahiro on 2016/05/26.
//  Copyright © 2016年 YamashitaMasahiro. All rights reserved.
//

#import "ViewController.h"
#import "MYSunMoon.h"
#import "MYLocationBrain.h"

#define LOCATIONBRAIN ((MYLocationBrain *)[MYLocationBrain sharedInstance])

@interface ViewController ()
@property (strong, nonatomic) MYLocationBrain *locationBrain;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) NSDate *date;
@property (nonatomic, strong) MYSunMoon *sunMoon;
@property (nonatomic) NSString *cityName;
@property (nonatomic) double latitude, longitude;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self sunMoon];
    [self locationBrain];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self setLocation];
    [self initialSetting];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MYSunMoon *)sunMoon
{
    if (!_sunMoon) {
        _sunMoon = [MYSunMoon new];
    }
    return _sunMoon;
}

- (MYLocationBrain *)locationBrain
{
    if (!_locationBrain) {
        _locationBrain = [MYLocationBrain new];
    }
    return _locationBrain;
}

- (void)initialSetting
{
    _date = [self returnLocaleDate:[NSDate new]];
    NSString *sunrize = [[_sunMoon sunRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:0] substringToIndex:5];
    //NSLog(@"getSunMoon 2");
    NSString *sunset = [[_sunMoon sunRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:1] substringToIndex:5];
    
    NSString *moonrize = [[_sunMoon moonRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:0] substringToIndex:5];
    NSString *moonset = [[_sunMoon moonRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:1] substringToIndex:5];
    _sunLabel.text = [NSString  stringWithFormat:@"%@  : %@ | %@  : %@", @"SunRize", sunrize, @"SunSet", sunset];
    _moonLabel.text = [NSString  stringWithFormat:@"%@ : %@ | %@ : %@ ", @"MoonRize", moonrize, @"MoonSet", moonset];
    _cityLabel.text = _cityName;

}


- (NSDate *)returnLocaleDate:(NSDate *)date
{
    // get Calendar local
    NSCalendar* cal = [NSCalendar currentCalendar];
    
    NSUInteger flg = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
    | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    
    NSDateComponents* localTime = [cal components:flg fromDate:date];
    return  [cal dateFromComponents:localTime];
}

#pragma mark - get Location
- (void)setLocation
{
    
    _locationManager = [LOCATIONBRAIN location];
    CLAuthorizationStatus status = [self CheckLocationService];
    if ((status == kCLAuthorizationStatusAuthorizedAlways) || (status == kCLAuthorizationStatusAuthorizedWhenInUse)) {
        //_locationManager = [LOCATIONBRAIN location];
        CLLocation *location = _locationManager.location;
        if (!location) {
            return;
        }
        CLLocationCoordinate2D coordinate = [location coordinate];
        _latitude = coordinate.latitude;
        _longitude = coordinate.longitude;
        
        CLPlacemark *place = [LOCATIONBRAIN revGeocodeLocation:location];
        if (place) {
            _cityName = [place.addressDictionary objectForKey:@"City"];
        }
        [_locationManager stopMonitoringSignificantLocationChanges];
    }
}

- (CLAuthorizationStatus)CheckLocationService
{
    return [CLLocationManager authorizationStatus];
}
@end
