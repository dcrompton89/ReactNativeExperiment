//
//  DJCStarRating.m
//  AwesomeProject
//
//  Created by Daniel Crompton on 01/06/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "DJCStarRating.h"
#import "StarRatingViewController.h"

@implementation DJCStarRating

RCT_EXPORT_MODULE()

-(UIView*)view
{
  StarRatingViewController* starRatingVC = [StarRatingViewController loadController:[StarRatingViewController class]];
  return starRatingVC.view;
}

@end
