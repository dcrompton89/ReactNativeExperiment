//
//  StarRatingViewController.m
//  AwesomeProject
//
//  Created by Daniel Crompton on 01/06/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "StarRatingViewController.h"

@interface StarRatingViewController ()

@property (strong, nonatomic) IBOutlet UIButton *star1;
@property (strong, nonatomic) IBOutlet UIButton *star2;
@property (strong, nonatomic) IBOutlet UIButton *star3;
@property (strong, nonatomic) IBOutlet UIButton *star4;
@property (strong, nonatomic) IBOutlet UIButton *star5;
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
    
}

- (IBAction)star2Tapped:(id)sender {
    
}

- (IBAction)star3Tapped:(id)sender {
    
}

- (IBAction)star4Tapped:(id)sender {
    
}

- (IBAction)star5Tapped:(id)sender {
    
}


@end
