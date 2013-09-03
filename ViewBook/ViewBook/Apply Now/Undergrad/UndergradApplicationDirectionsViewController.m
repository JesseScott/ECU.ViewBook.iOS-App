//
//  UndergradApplicationDirectionsViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "UndergradApplicationDirectionsViewController.h"

@interface UndergradApplicationDirectionsViewController ()

@end

@implementation UndergradApplicationDirectionsViewController

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
    sectionHeaderFont = [UIFont fontWithName:@"LeituraSans-Grot2" size:18];
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"ApplyNowScreenNames" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    pageTitle.text = [screenNames objectAtIndex:screenIndex];
    pageTitle.font = titleFont;
    
    // Set Color Of Title
    pageTitle.textColor = [UIColor colorWithRed:(321/255.0) green:(0/255.0) blue:(93/255.0) alpha:255];
    
    // Load Text File
    NSString *pathToFile = [[NSBundle mainBundle] pathForResource:@"UGApplicationDirections" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:NULL];
    
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
    
    // Set Attributed Ranges For Sub-Headings
    [richString setAttributes:boldText range:NSMakeRange(0, 7)]; // Step 1
    [richString setAttributes:boldText range:NSMakeRange(75, 7)]; // Step 2
    [richString setAttributes:boldText range:NSMakeRange(154, 7)]; // Step 3
    [richString setAttributes:boldText range:NSMakeRange(264, 7)]; // Step 4
    [richString setAttributes:boldText range:NSMakeRange(309, 7)]; // Step 5
    
    // Set Text File To Main Paragraph Label
    mainParagraph.editable = NO;
    mainParagraph.attributedText = richString;
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
