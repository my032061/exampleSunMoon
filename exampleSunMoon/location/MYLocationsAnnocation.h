//
//  MYLocationsAnnocation.h
//
//  Created by Masahiro Yamashita on 2012/11/29.
//  Copyright (c) 2012 Masahiro Yamashita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MYLocationsAnnocation : NSObject
<MKAnnotation>
@property(nonatomic)CLLocationCoordinate2D coordinate;
@property(nonatomic) NSString *LocationTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)co  title:(NSString *)t;


@end
