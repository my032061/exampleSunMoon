//
//  MYSunMoon.h
//  TestMoon
//
//  Created by Masahiro Yamashita. on 2014/05/10.
//  Copyright (c) 2014年 Masahiro Yamashita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYSunMoon : NSObject
-(double)lngsun:(NSDate *)date;
-(double)lngmoon:(NSDate *)date;
-(double) nsdate2jy:(NSDate *)date;
- (NSString *)sunRizeSet:(NSDate *)date  dheight:(double)height dlongitude:(double)longitude dlatitude:(double)latitude iflg:(int)flag;
- (NSString *)moonRizeSet:(NSDate *)date  dheight:(double)height dlongitude:(double)longitude dlatitude:(double)latitude iflg:(int)flag;

@end
