//
//  ApplyNowViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-09-01.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "ApplyNowViewController.h"

@interface ApplyNowViewController ()

@end

@implementation ApplyNowViewController

// Synthesize Variables
@synthesize undergradButton, graduateButton, csButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Load Font
    buttonFont = [UIFont fontWithName:@"GothamRounded-Medium" size:18];
    undergradButton.titleLabel.font = buttonFont;
    graduateButton.titleLabel.font = buttonFont;
    csButton.titleLabel.font = buttonFont;
    
    // Set Colors
    /*
    [undergradButton setTitleColor:[UIColor colorWithRed:141 green:207 blue:105 alpha:255] forState:UIControlStateNormal];
    [graduateButton setTitleColor:[UIColor colorWithRed:0 green:174 blue:239 alpha:255] forState:UIControlStateNormal];
    [csButton setTitleColor:[UIColor colorWithRed:248 green:78 blue:87 alpha:255] forState:UIControlStateNormal];
    */
    
}

- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
