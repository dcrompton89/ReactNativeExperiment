
//
//  StarRatingViewController.m
//  AwesomeProject
//
//  Created by Daniel Crompton on 01/06/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "StarRatingViewController.h"
#import "Rating.h"

@interface StarRatingViewController ()


@end

@implementation StarRatingViewController

+ (id)loadController:(Class)classType {
    NSString* className = NSStringFromClass(classType);
    UIViewController *controller = [[StarRatingViewController alloc] initWithNibName:className bundle:nil];
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
