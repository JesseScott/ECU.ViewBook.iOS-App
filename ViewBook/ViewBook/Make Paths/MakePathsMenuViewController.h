//
//  MakePathsMenuViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-31.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakePathsMenuViewController : UIViewController {
    
    // Font
    UIFont *buttonFont;
    
}

// Undergrad Button
- (IBAction)launchUndergrad:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *undergradButton;

// Grad Button
- (IBAction)launchGraduate:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *graduateButton;

// CS Button
- (IBAction)launchCS:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *csButton;

@end
