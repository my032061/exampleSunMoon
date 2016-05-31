//
//  MYLocationsAnnocation.m
//  EasyReminderEditor
//
//  Created by Masahiro Yamashita on 2012/11/29.
//  Copyright (c) 2012 Masahiro Yamashita. All rights reserved.
//

#import "MYLocationsAnnocation.h"

@implementation MYLocationsAnnocation

-(id)initWithCoordinate:(CLLocationCoordinate2D)co title:(NSString *)t
{
    _coordinate = co;
    _LocationTitle = t;
    return self;
}


@end
