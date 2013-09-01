//
//  CSContactECUADViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-09-01.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface CSContactECUADViewController : UIViewController<MFMailComposeViewControllerDelegate, UITextFieldDelegate> {
    
    // Screen Index
    NSInteger screenIndex;
    
    // Custom Font
    UIFont *titleFont, *paragraphFont;
    
}

// Email Forms
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *messageField;

// Page Title
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;

// Main Paragraph
@property (weak, nonatomic) IBOutlet UITextView *mainParagraph;

// Back To Main Menu
- (IBAction)back:(id)sender;


@end
