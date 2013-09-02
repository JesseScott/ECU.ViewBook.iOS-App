//
//  UndergradVisitUsViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-29.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "UndergradVisitUsViewController.h"

@interface UndergradVisitUsViewController ()

@end

@implementation UndergradVisitUsViewController

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
    
    // Set Screen Index
    screenIndex = 2;
    
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
    pageTitle.textColor = [UIColor colorWithRed:(72/255.0) green:(89/255.0) blue:(86/255.0) alpha:255];
    
    // Load Text File
    NSString *pathToFile = [[NSBundle mainBundle] pathForResource:@"UGVisitUs" ofType:@"txt"];
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
    [richString setAttributes:boldText range:NSMakeRange(0, 20)]; // Visit Us
    [richString setAttributes:boldText range:NSMakeRange(336, 66)]; // Future
    
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

@end
