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
@synthesize slideshow;


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
    NSArray *infographics = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"alumni_survey_01"],
                                [UIImage imageNamed:@"alumni_survey_02"],
                                [UIImage imageNamed:@"alumni_survey_03"],
                                [UIImage imageNamed:@"alumni_survey_04"],
                                [UIImage imageNamed:@"alumni_survey_05"],
                                nil];
    
    // Set ImageView
    [slideshow setAnimationImages:infographics];
    slideshow.animationDuration = 25.0;
    slideshow.animationRepeatCount = 0;
    [slideshow startAnimating];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}


@end
