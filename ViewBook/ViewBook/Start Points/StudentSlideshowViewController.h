//
//  StudentSlideshowViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentSlideshowViewController : UIViewController {
    
    // Custom Font
    UIFont *captionFont;
    
}

// Image View
@property (weak, nonatomic) IBOutlet UIImageView *slideshow;

// Swipe
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic) NSInteger swipeCount;

- (IBAction)previousImage:(UISwipeGestureRecognizer *)sender;
- (IBAction)nextImage:(UISwipeGestureRecognizer *)sender;

// Captions
@property (copy,nonatomic) NSArray *students;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (copy,nonatomic) NSArray *captionText;

// Back To Main Menu
- (IBAction)back:(id)sender;

@end
