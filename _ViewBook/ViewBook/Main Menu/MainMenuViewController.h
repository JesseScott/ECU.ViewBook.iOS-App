//
//  MainMenuViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-07-13.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSTimer.h>

@interface MainMenuViewController : UIViewController {
    NSTimer *timer;
    
    // Font
    UIFont *buttonFont;
}

// Buttons

- (IBAction)loadStartPointsStoryboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *startPointsButton;

- (IBAction)loadMakePathsStoryboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *makePathsButton;

- (IBAction)loadBuildNetworksStoryboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buildNetworksButton;

- (IBAction)loadCreateFuturesStoryboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *createFuturesButton;

- (IBAction)loadApplyNowStoryboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *applyNowButton;

@end
