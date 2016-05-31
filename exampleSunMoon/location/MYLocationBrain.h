//
//  MYLocationBrain.h
//  EasyReminderEditor
//
//  Created by Masahiro Yamashita on 2015/11/29.
//  Copyright (c) 2015 Masahiro Yamashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MYLocationBrain : NSObject

@property (strong, nonatomic) CLLocationManager *locationManager;

+ (MYLocationBrain *) sharedInstance;
- (CLLocationManager *) location;
- (CLPlacemark *) revGeocodeLocation:(CLLocation *)location;
- (NSArray *) geolocation:(NSString *)keyword;

@end
