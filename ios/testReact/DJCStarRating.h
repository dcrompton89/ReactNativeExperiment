//
//  DJCStarRating.h
//  AwesomeProject
//
//  Created by Daniel Crompton on 01/06/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//


#import "RCTView.h"

@interface DJCStarRating : RCTView

@property(strong, nonatomic) NSNumber * givenRating;
@property (strong, nonatomic) IBOutlet UIButton *star1;
@property (strong, nonatomic) IBOutlet UIButton *star2;
@property (strong, nonatomic) IBOutlet UIButton *star3;
@property (strong, nonatomic) IBOutlet UIButton *star4;
@property (strong, nonatomic) IBOutlet UIButton *star5;



@end
