//
//  MakePathsMenuViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-31.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "MakePathsMenuViewController.h"

@interface MakePathsMenuViewController ()

@end

@implementation MakePathsMenuViewController

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
    [undergradButton setTitleColor:[UIColor colorWithRed:(141/255.0) green:(207/255.0) blue:(105/255.0) alpha:255] forState:UIControlStateNormal];
    [graduateButton setTitleColor:[UIColor colorWithRed:(0/255.0) green:(174/255.0) blue:(239/255.0) alpha:255] forState:UIControlStateNormal];
    [csButton setTitleColor:[UIColor colorWithRed:(248/255.0) green:(78/255.0) blue:(87/255.0) alpha:255] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"pushToUndegradCourses"]) {
        //UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
    else if([segue.identifier isEqualToString:@"pushToGraduateCourses"]) {
        //UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
    else if([segue.identifier isEqualToString:@"pushToCSCourses"]) {
        //UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
}


- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}

- (void)viewDidUnload {
    [self setUndergradButton:nil];
    [self setGraduateButton:nil];
    [self setCsButton:nil];
    [super viewDidUnload];
}
@end
