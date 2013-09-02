//
//  GraduateApplicationDirectionsViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-09-01.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "GraduateApplicationDirectionsViewController.h"

@interface GraduateApplicationDirectionsViewController ()

@end

@implementation GraduateApplicationDirectionsViewController

// Synthesize Variables

@synthesize mainParagraph;
@synthesize pageTitle;

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
    
    // Set Screen Index
    screenIndex = 0;
    
    // Load Fonts
    titleFont = [UIFont fontWithName:@"LeituraSans-Grot2" size:22];
    paragraphFont = [UIFont fontWithName:@"Leitura Sans" size:18];
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"ApplyNowScreenNames" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    pageTitle.text = [screenNames objectAtIndex:screenIndex];
    pageTitle.font = titleFont;
    
    // Set Color Of Title
    pageTitle.textColor = [UIColor colorWithRed:(66/255.0) green:(87/255.0) blue:(101/255.0) alpha:255];
    
    // Load Text File
    NSString *pathToFile = [[NSBundle mainBundle] pathForResource:@"GRApplicationDirections" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:NULL];
    
    // Set Text File To Label
    mainParagraph.text = fileContent;
    mainParagraph.font = paragraphFont;
    
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMainParagraph:nil];
    [super viewDidUnload];
}

@end
