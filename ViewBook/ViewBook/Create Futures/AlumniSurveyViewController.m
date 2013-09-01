//
//  CreateFuturesViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-17.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "AlumniSurveyViewController.h"

@interface AlumniSurveyViewController ()

@end

@implementation AlumniSurveyViewController

// Synthesize Variables
@synthesize slideshow, infographics;
@synthesize leftSwipe, rightSwipe, swipeCount;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Load Font
    captionFont = [UIFont fontWithName:@"Leitura Sans" size:18];
    
    // Load Images
    self.infographics = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"alumni_survey_01"],
                                [UIImage imageNamed:@"alumni_survey_02"],
                                [UIImage imageNamed:@"alumni_survey_03"],
                                [UIImage imageNamed:@"alumni_survey_04"],
                                [UIImage imageNamed:@"alumni_survey_05"],
                                nil];
    
    // Set ImageView
//    [slideshow setAnimationImages:infographics];
//    slideshow.animationDuration = 25.0;
//    slideshow.animationRepeatCount = 0;
//    [slideshow startAnimating];
    
    // Load first image and caption
    self.swipeCount = 2;
    [slideshow setImage:[self.infographics objectAtIndex:self.swipeCount]];
    
    // Add Gesture Recognition
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    
}

- (IBAction)previousImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"left swipe");
    if(self.swipeCount < self.infographics.count-1){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.infographics.count-1);
        self.swipeCount=self.swipeCount+1;
        [slideshow setImage:[self.infographics objectAtIndex:self.swipeCount]];
    }
}

- (IBAction)nextImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"right swipe");
    if(self.swipeCount >0){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.infographics.count-1);
        self.swipeCount=self.swipeCount-1;
        [slideshow setImage:[self.infographics objectAtIndex:self.swipeCount]];
    }
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
