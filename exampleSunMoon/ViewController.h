//
//  ViewController.h
//  exampleSunMoon
//
//  Created by YamashitaMasahiro on 2016/05/26.
//  Copyright © 2016年 YamashitaMasahiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *sunLabel;
@property (weak, nonatomic) IBOutlet UILabel *moonLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;


@end

