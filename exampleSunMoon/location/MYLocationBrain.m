//
// MYLocationBrain.m
//  EasyReminderEditor
//
//  Created by Masahiro Yamashita on 2015/11/29.
//  Copyright (c) 2015 Masahiro Yamashita. All rights reserved.
//

#import "MYLocationBrain.h"
#import "MYLocationsAnnocation.h"

@implementation MYLocationBrain

static MYLocationBrain *myInstance = nil;

+ (MYLocationBrain *)sharedInstance
{
    @synchronized(self) {
        if (myInstance == nil) {
            myInstance = [self new];
        }
    }
    return myInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (myInstance == nil) {
            myInstance = [super allocWithZone:zone];
            return myInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}

- (CLLocationManager *)location
{
    if (_locationManager != nil) {
        return _locationManager;
    }
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = _locationManager.delegate;
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        // >ios8
         [self.locationManager requestAlwaysAuthorization];
    }
    else {
        // ios7
        [_locationManager startMonitoringSignificantLocationChanges];
    }
    return _locationManager;
    
}

#pragma mark - revers GeoCodeing
//**
// reversGeoCodeing return placemarks
//
- (CLPlacemark *)revGeocodeLocation:(CLLocation *)location
{
    __block CLPlacemark *places = nil;
    __block BOOL fetching = YES;
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        //
        if (error) {
            NSLog(@"geolocation error !!");
        }
        else {
            places = (CLPlacemark *)[placemarks lastObject];
        }
        fetching = NO;
    }];
    while (fetching) {
        [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    }
    
    return places;
}

# pragma mark - Geo

- (NSArray *)geolocation:(NSString *)keyword
{
    __block NSArray *places = nil;
    __block BOOL fetching = YES;
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:keyword completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"geolocation error !!");
        }
        else {
            for (CLPlacemark *p in placemarks) {
                NSLog(@"place -> %@", p);
            }
            places = placemarks;
        }
        fetching = NO;
    }];
    while (fetching) {
        [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    }
    
    return places;
}

@end
