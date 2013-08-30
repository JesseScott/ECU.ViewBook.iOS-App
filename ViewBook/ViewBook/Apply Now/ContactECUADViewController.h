//
//  ContactECUADViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactECUADViewController : UIViewController<MFMailComposeViewControllerDelegate, UITextFieldDelegate> {
    
    // Screen Index
    NSInteger screenIndex;
    
    // Custom Font
    UIFont *titleFont, *paragraphFont;
    
}

// Page Title
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;


// Back To Main Menu
- (IBAction)back:(id)sender;

@end
