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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"pushToUndegradCourses"]) {
        NSLog(@"Undergrad Segue");
        //UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
    else if([segue.identifier isEqualToString:@"pushToGraduateCourses"]) {
        NSLog(@"Grad Segue");
        //UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
    else if([segue.identifier isEqualToString:@"pushToCSCourses"]) {
        NSLog(@"CS Segue");
        //UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
}

- (IBAction)launchUndergrad:(id)sender {
    NSLog(@"Undergrad Button");
    [self performSegueWithIdentifier:@"pushToGraduateCourses" sender:sender];
}

- (IBAction)launchGraduate:(id)sender {
    NSLog(@"Grad Button");
    [self performSegueWithIdentifier:@"pushToGraduateCourses" sender:sender];
}

- (IBAction)launchCS:(id)sender {
    NSLog(@"CS Button");
    [self performSegueWithIdentifier:@"pushToCSCourses" sender:sender];
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
