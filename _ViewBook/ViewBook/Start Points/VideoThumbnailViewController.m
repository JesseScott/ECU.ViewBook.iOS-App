//
//  VideoThumbnailViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-25.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "VideoThumbnailViewController.h"
#import "WebViewViewController.h"

@interface VideoThumbnailViewController ()

@end

@implementation VideoThumbnailViewController

// Synthesize Variables

@synthesize topLabel, middleLabel, bottomLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    vimeoURL = [[NSString alloc] init];
    
    
    // Load Font
    labelFont = [UIFont fontWithName:@"GothamRounded-Medium" size:16];
    topLabel.font = labelFont;
    middleLabel.font = labelFont;
    bottomLabel.font = labelFont;
    
    // Color Font
    [topLabel setTextColor:[UIColor colorWithRed:(31/255.0) green:(170/255.0) blue:(237/255.0) alpha:255]];
    [middleLabel setTextColor:[UIColor colorWithRed:(31/255.0) green:(170/255.0) blue:(237/255.0) alpha:255]];
    [bottomLabel setTextColor:[UIColor colorWithRed:(31/255.0) green:(170/255.0) blue:(237/255.0) alpha:255]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Orientation
/*
- (BOOL)shouldAutorotate {
    NSLog(@"SAR");
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations{
    NSLog(@"SIO");
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    NSLog(@"PIOFP");
    return UIInterfaceOrientationLandscapeLeft;
}
*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"playVimeo"]) {
        
        //UIViewController *portraitViewController = [[UIViewController alloc] init];
        //UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:portraitViewController];
        //[self.navigationController presentModalViewController:nc animated:NO];
        //[self.navigationController dismissModalViewControllerAnimated:NO];
        
        WebViewViewController *controller = (WebViewViewController *)segue.destinationViewController;
        //UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.vimeoURL = vimeoURL;
    }
}

// Vimeo Actions

- (IBAction)launchDayInTheLife:(id)sender {
    vimeoURL = @"50235843";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)launchCreativeFuture:(id)sender {
    vimeoURL = @"72053500";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)launchErinBoniferro:(id)sender {
    vimeoURL = @"64750565";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)launchLukeParnell:(id)sender {
    vimeoURL = @"56767251";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)launchGiantAnt:(id)sender {
    vimeoURL = @"68332198";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)launchLisaFraser:(id)sender {
    vimeoURL = @"73250441";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)launchDesignCommunity:(id)sender {
    vimeoURL = @"51320873";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)launchAudainSchool:(id)sender {
    vimeoURL = @"61262691";
    [self performSegueWithIdentifier:@"playVimeo" sender:sender];
}

- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}

- (void)viewDidUnload {
    [self setTopLabel:nil];
    [self setMiddleLabel:nil];
    [self setBottomLabel:nil];

    [super viewDidUnload];
}
@end
