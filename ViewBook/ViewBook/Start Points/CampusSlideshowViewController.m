//
//  CampusSlideshowViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "CampusSlideshowViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CampusSlideshowViewController ()


@end

@implementation CampusSlideshowViewController

// Synthesize Variables
@synthesize slideshow;
@synthesize leftSwipe, rightSwipe, swipeCount;
@synthesize campus, caption, captionText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    // Load Images
    self.campus = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"campus_slideshow_01"],
                        [UIImage imageNamed:@"campus_slideshow_02"],
                        [UIImage imageNamed:@"campus_slideshow_03"],
                        [UIImage imageNamed:@"campus_slideshow_04"],
                        [UIImage imageNamed:@"campus_slideshow_05"],
                        [UIImage imageNamed:@"campus_slideshow_06"],
                        nil];

    
    // Load PList 
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"CampusCaptions" ofType:@"plist"];
    
    // Set Caption Array
    self.captionText = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];

    // Load Fonts
    captionFont = [UIFont fontWithName:@"Leitura Sans" size:12];
    self.caption.font = captionFont;
    
    // Text Attributes
    self.caption.textColor = [UIColor blackColor];
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:-2];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[self.captionText objectAtIndex:self.swipeCount]];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, caption.text.length)];
    caption.attributedText = attributedString ;
    
    // Set Gestures and load first image and caption
    self.swipeCount = 0;
    [slideshow setImage:[self.campus objectAtIndex:self.swipeCount]];

    // Add Swipe Detection
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];

    
}

- (IBAction)previousImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"left swipe");
    if(self.swipeCount < self.campus.count - 1) {
        //NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.campus.count-1);
        
        // Set Index
        self.swipeCount = self.swipeCount + 1;
        
        // Set Image
        [slideshow setImage:[self.campus objectAtIndex:self.swipeCount]];
        
        // Set Text
        NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
        [paragrahStyle setLineSpacing:-2];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[self.captionText objectAtIndex:self.swipeCount]];
        NSString *len = [[NSString alloc] initWithString:[self.captionText objectAtIndex:self.swipeCount]];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, len.length)];
        caption.attributedText = attributedString ;
    }
}

- (IBAction)nextImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"right swipe");
    if(self.swipeCount > 0){
        //NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.campus.count-1);
        
        // Set Index
        self.swipeCount = self.swipeCount - 1;
        
        // Set Image
        [slideshow setImage:[self.campus objectAtIndex:self.swipeCount]];
        
        // Set Text
        NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
        [paragrahStyle setLineSpacing:-2];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[self.captionText objectAtIndex:self.swipeCount]];
        NSString *len = [[NSString alloc] initWithString:[self.captionText objectAtIndex:self.swipeCount]];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, len.length)];
        caption.attributedText = attributedString ;
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


- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
