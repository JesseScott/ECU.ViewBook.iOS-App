//
//  BachelorsFineArtViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-31.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "BachelorsFineArtViewController.h"

@interface BachelorsFineArtViewController ()

@end

@implementation BachelorsFineArtViewController

// Synthesize Variables
@synthesize courseTitle, courseDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Set Screen Index
    screenIndex = 3;
    
    // Load Fonts
    titleFont = [UIFont fontWithName:@"LeituraSans-Grot2" size:22];
    paragraphFont = [UIFont fontWithName:@"Leitura Sans" size:18];
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"UndergraduateCourses" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    courseTitle.text = [screenNames objectAtIndex:screenIndex];
    courseTitle.font = titleFont;
    
    // Load Text File For Main Paragraph
    NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:@"Fine Arts Majors" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
    
    // Set Text File To Main Paragraph Label
    courseDescription.editable = NO;
    courseDescription.text = fileContent;
    courseDescription.font = paragraphFont;
    
    
}

// Back Button
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCourseTitle:nil];
    [self setCourseDescription:nil];
    [super viewDidUnload];
}

@end