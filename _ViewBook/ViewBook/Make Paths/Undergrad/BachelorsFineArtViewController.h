//
//  BachelorsFineArtViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-31.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BachelorsFineArtViewController : UIViewController {
    
    // Screen Index
    NSInteger screenIndex;
    
    // Custom Font
    UIFont *titleFont, *paragraphFont, *sectionHeaderFont;
    
}

// Labels
@property (weak, nonatomic) IBOutlet UILabel *courseTitle;
@property (weak, nonatomic) IBOutlet UITextView *courseDescription;

// Back To Main Menu
- (IBAction)back:(id)sender;

@end
