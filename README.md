# exampleSunMoon

## Overview

Returns the time of moonset out of the sunrise sunset, the moon in the string


## Example

see exampleSunMoon.xcodeproj


## Usage

    _sunMoon = [MYSunMoon new];
    NSString *sunrize = [[_sunMoon sunRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:0] substringToIndex:5];
    NSString *sunSet = [[_sunMoon sunRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:0] substringToIndex:5];
    NSString *moonRizerize = [[_sunMoon moonRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:0] substringToIndex:5];
    NSString *moonSet = [[_sunMoon moonRizeSet:_date dheight:0 dlongitude:_longitude dlatitude:_latitude iflg:0] substringToIndex:5];

day: NSDate  
dheight : Double  
dlongitude : Double  
dlatitude : Double  
iflag: int -> 0 : sunRize moonRize , 1 : sunSet, moonSet

## Install

impot "MYSunMoon.h"

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author
Masahiro Yamashita
