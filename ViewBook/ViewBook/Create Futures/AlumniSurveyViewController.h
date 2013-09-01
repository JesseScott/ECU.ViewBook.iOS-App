//
//  AlumniSurveyViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-17.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlumniSurveyViewController : UIViewController {
    
    // Screen Index
    NSInteger screenIndex;
    
    // Custom Font
    UIFont *captionFont;
    
}

// Image View
@property (weak, nonatomic) IBOutlet UIImageView *slideshow;

// Swipe Detection
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic) NSInteger swipeCount;
@property (copy,nonatomic) NSArray *infographics;

// Back To Main Menu
- (IBAction)back:(id)sender;

@end
