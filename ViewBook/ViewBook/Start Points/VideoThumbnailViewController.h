//
//  VideoThumbnailViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-25.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoThumbnailViewController : UIViewController {
    
    NSString *vimeoURL;
    
    // Font
    UIFont *labelFont;
    
}

// Thumbnail Buttons
- (IBAction)launchDayInTheLife:(id)sender;
- (IBAction)launchCreativeFuture:(id)sender;
- (IBAction)launchErinBoniferro:(id)sender;
- (IBAction)launchLukeParnell:(id)sender;
- (IBAction)launchGiantAnt:(id)sender;
- (IBAction)launchLisaFraser:(id)sender;
- (IBAction)launchDesignCommunity:(id)sender;
- (IBAction)launchAudainSchool:(id)sender;

// Labels
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;


// Back To Main Menu
- (IBAction)back:(id)sender;

@end
