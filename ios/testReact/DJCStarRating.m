//
//  DJCStarRating.m
//  AwesomeProject
//
//  Created by Daniel Crompton on 01/06/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

@import Foundation;
#import "RCTJavaScriptLoader.h"
#import "RCTBridge.h"
#import "RCTRootView.h"
#import "RCTViewManager.h"
#import "AppDelegate.h"
#import "DJCStarRating.h"

@interface DJCStarRatingManager : RCTViewManager

@end

@implementation DJCStarRatingManager{
   UIView *_starView;
}

RCT_EXPORT_MODULE()

-(UIView*)view
{
  return [[DJCStarRating alloc]init];
}

@end

@implementation DJCStarRating{

}

enum ratingLevel{
  oneStar = 1,
  twoStar,
  threeStar,
  fourStar,
  fiveStar
};

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
  {
    self.givenRating = @NO;
    for (int i = 1; i<6; i++) {
      [self addSubview:[self createButton:i]];
    }
   
  }
  return self;
}

- (NSArray<UIView<RCTComponent> *> *)reactSubviews
{
  // this is to avoid unregistering our RCTRootView when the component is removed from RN hierarchy
  return @[];
}


-(UIButton*)createButton:(int)starNumber
{
  NSString* buttonName = [NSString stringWithFormat:@"star%dTapped:", starNumber];
  UIButton* button = [self configureButtonAtPosition:starNumber];
  [button setBackgroundImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
  SEL selector = NSSelectorFromString(buttonName);
  [button addTarget:self
              action:selector
    forControlEvents:UIControlEventTouchUpInside];
  return button;
}

-(UIButton*)configureButtonAtPosition:(int)pos{
  
  int buttonWidth = 70;
  int buttonHeight = 70;
  int padding = 15;
  int leftMargin = 10;
  int topMargin = 20;
  
  switch (pos) {
    case 1:
    {
      self.star1 = [UIButton buttonWithType:UIButtonTypeCustom];
      self.star1.frame = CGRectMake(leftMargin, topMargin, buttonWidth, buttonHeight);
      NSString* buttonName = [NSString stringWithFormat:@"star%dTapped:", pos];
      SEL selector = NSSelectorFromString(buttonName);
      [self.star1 addTarget:self
                 action:selector
       forControlEvents:UIControlEventTouchUpInside];
      return self.star1;
      break;
    }
    case 2:
    {
      self.star2 = [UIButton buttonWithType:UIButtonTypeCustom];
      self.star2.frame = CGRectMake((buttonWidth*(pos-1))+padding, topMargin, buttonWidth, buttonHeight);
      NSString* buttonName = [NSString stringWithFormat:@"star%dTapped:", pos];
      SEL selector = NSSelectorFromString(buttonName);
      [self.star2 addTarget:self
                     action:selector
           forControlEvents:UIControlEventTouchUpInside];
      return self.star2;
      break;
    }
    case 3:
    {
      self.star3 = [UIButton buttonWithType:UIButtonTypeCustom];
      self.star3.frame = CGRectMake((buttonWidth*(pos-1))+padding, topMargin, buttonWidth, buttonHeight);
      NSString* buttonName = [NSString stringWithFormat:@"star%dTapped:", pos];
      SEL selector = NSSelectorFromString(buttonName);
      [self.star3 addTarget:self
                     action:selector
           forControlEvents:UIControlEventTouchUpInside];
      return self.star3;
      break;
    }
    case 4:
    {
      self.star4 = [UIButton buttonWithType:UIButtonTypeCustom];
      self.star4.frame = CGRectMake((buttonWidth*(pos-1))+padding, topMargin, buttonWidth, buttonHeight);
      NSString* buttonName = [NSString stringWithFormat:@"star%dTapped:", pos];
      SEL selector = NSSelectorFromString(buttonName);
      [self.star4 addTarget:self
                     action:selector
           forControlEvents:UIControlEventTouchUpInside];
      return self.star4;
      break;
    }
    case 5:
    {
      self.star5 = [UIButton buttonWithType:UIButtonTypeCustom];
      self.star5.frame = CGRectMake((buttonWidth*(pos-1))+padding, topMargin, buttonWidth, buttonHeight);
      NSString* buttonName = [NSString stringWithFormat:@"star%dTapped:", pos];
      SEL selector = NSSelectorFromString(buttonName);
      [self.star5 addTarget:self
                     action:selector
           forControlEvents:UIControlEventTouchUpInside];
      return self.star5;
      break;
    }
    default:
      break;
  }
  return self.star1;
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
      if(self.star1.tag == 1){
        [self clearAllStars];
        return;
      }
      [self.star1 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star2 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star3 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star4 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star5 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star1 setTag:1];
      [self.star2 setTag:0];
      [self.star3 setTag:0];
      [self.star4 setTag:0];
      [self.star5 setTag:0];
    }
      break;
    case twoStar:
    {
      if(self.star2.tag == 1){
        [self clearAllStars];
        return;
      }
      [self.star1 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star2 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star3 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star4 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star5 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star1 setTag:1];
      [self.star2 setTag:1];
      [self.star3 setTag:0];
      [self.star4 setTag:0];
      [self.star5 setTag:0];
    }
      break;
    case threeStar:
    {
      if(self.star3.tag == 1){
        [self clearAllStars];
        return;
      }
      [self.star1 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star2 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star3 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star4 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star5 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star1 setTag:1];
      [self.star2 setTag:1];
      [self.star3 setTag:1];
      [self.star4 setTag:0];
      [self.star5 setTag:0];
    }
      break;
    case fourStar:
    {
      if(self.star4.tag == 1){
        [self clearAllStars];
        return;
      }
      [self.star1 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star2 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star3 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star4 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star5 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
      [self.star1 setTag:1];
      [self.star2 setTag:1];
      [self.star3 setTag:1];
      [self.star4 setTag:1];
      [self.star5 setTag:0];
    }
      break;
    case fiveStar:
    {
      if(self.star1.tag == 1){
        [self clearAllStars];
        return;
      }
      [self.star1 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star2 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star3 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star4 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star5 setImage:[UIImage imageNamed:@"starChecked.png"] forState:UIControlStateNormal];
      [self.star1 setTag:1];
      [self.star2 setTag:1];
      [self.star3 setTag:1];
      [self.star4 setTag:1];
      [self.star5 setTag:1];
    }
      break;
    default:
      break;
  }
}

-(void)clearAllStars{

    [self.star1 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
    [self.star2 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
    [self.star3 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
    [self.star4 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
    [self.star5 setImage:[UIImage imageNamed:@"starUnchecked.png"] forState:UIControlStateNormal];
    [self.star1 setTag:0];
    [self.star2 setTag:0];
    [self.star3 setTag:0];
    [self.star4 setTag:0];
    [self.star5 setTag:0];
  
}





@end
