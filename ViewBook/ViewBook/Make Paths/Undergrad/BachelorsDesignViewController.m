//
//  BachelorsDesignViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-31.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "BachelorsDesignViewController.h"

@interface BachelorsDesignViewController ()

@end

@implementation BachelorsDesignViewController

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
    screenIndex = 1;
    
    // Load Fonts
    titleFont = [UIFont fontWithName:@"LeituraSans-Grot2" size:22];
    paragraphFont = [UIFont fontWithName:@"Leitura Sans" size:18];
    sectionHeaderFont = [UIFont fontWithName:@"LeituraSans-Grot2" size:18];
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"UndergraduateCourses" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    courseTitle.text = [screenNames objectAtIndex:screenIndex];
    courseTitle.font = titleFont;
    
    // Set Color Of Title
    courseTitle.textColor = [UIColor colorWithRed:(255/255.0) green:(240/255.0) blue:(100/255.0) alpha:255];
    
    // Load Text File For Main Paragraph
    NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:@"Design Majors" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
    
    // Set Attributes
    UIColor *foregroundColor = [UIColor blackColor];
    
    NSDictionary *normalText = [NSDictionary dictionaryWithObjectsAndKeys:
                                paragraphFont, NSFontAttributeName,
                                foregroundColor, NSForegroundColorAttributeName, nil];
    
    NSDictionary *boldText = [NSDictionary dictionaryWithObjectsAndKeys:
                              sectionHeaderFont, NSFontAttributeName,
                              foregroundColor, NSForegroundColorAttributeName, nil];
    
    // Declare Mutable String
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:fileContent attributes:normalText];
    
    // Set Attributed Ranges
    [richString setAttributes:boldText range:NSMakeRange(0, 26)];
    [richString setAttributes:boldText range:NSMakeRange(461, 28)];
    [richString setAttributes:boldText range:NSMakeRange(782, 48)];
    
    // Set Text File To Main Paragraph Label
    courseDescription.editable = NO;
    courseDescription.attributedText = richString;
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