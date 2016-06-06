//
//  DJCStarRating.m
//  AwesomeProject
//
//  Created by Daniel Crompton on 01/06/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RCTJavaScriptLoader.h"
#import "RCTBridge.h"
#import "RCTRootView.h"
#import "RCTViewManager.h"
#import "AppDelegate.h"
#import "DJCStarRating.h"
#import "StarRatingViewController.h"
#import "Rating.h"

@interface DJCStarRatingManager : RCTViewManager

@end

@implementation DJCStarRatingManager{
   UIView *_starView;
}

RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(visible, BOOL)

-(UIView*)view
{
  return [DJCStarRating new];
}

@end



@implementation DJCStarRating{
    RCTRootView *_rootView;
    BOOL _visible;
  
}

-(BOOL)visible{
  return _visible;
}

-(void)setVisible:(BOOL)visible{
  _visible = visible;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
  {
      
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
      
    _rootView = [[RCTRootView alloc] initWithBridge:appDelegate.bridge
                                           moduleName:@"DJCStarRating"
                                    initialProperties:@{@"visible":@YES}];
     
    StarRatingViewController* starRatingVC = [StarRatingViewController loadController:[StarRatingViewController class]];
    UIView* ratingView = starRatingVC.view;
      
      
    [ratingView addSubview:[self createButton]];
    [self addSubview:ratingView];
    [self addSubview:_rootView];
  }
  return self;
}

-(UIButton*)createButton{
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Native Button" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [button setBackgroundColor:[UIColor grayColor]];
  [button addTarget:self
              action:@selector(star1Tapped:)
    forControlEvents:UIControlEventTouchUpInside];
  return button;
}


- (IBAction)star1Tapped:(id)sender {
  self.givenRating = [NSNumber numberWithInt:oneStar];
  [self markStarState:self.givenRating];
}

- (IBAction)star2Tapped:(id)sender {
  self.givenRating = [NSNumber numberWithInt:twoStar];
  [self markStarState:self.givenRating];
}

- (IBAction)star3Tapped:(id)sender {
  self.givenRating = [NSNumber numberWithInt:threeStar];
  [self markStarState:self.givenRating];
}

- (IBAction)star4Tapped:(id)sender {
  self.givenRating = [NSNumber numberWithInt:fourStar];
  [self markStarState:self.givenRating];
}

- (IBAction)star5Tapped:(id)sender {
  self.givenRating = [NSNumber numberWithInt:fiveStar];
  [self markStarState:self.givenRating];
}

-(void)markStarState:(NSNumber*)rating
{
  switch (rating.integerValue) {
    case oneStar:
    {
      [self.star1 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
    }
      break;
    case twoStar:
    {
      [self.star2 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
    }
      break;
    case threeStar:
    {
      [self.star3 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
    }
      break;
    case fourStar:
    {
      [self.star4 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
    }
      break;
    case fiveStar:
    {
      [self.star5 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
    }
      break;
    default:
      break;
  }
}



@end
