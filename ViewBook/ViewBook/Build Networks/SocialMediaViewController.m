//
//  SocialMediaViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "SocialMediaViewController.h"

@interface SocialMediaViewController ()

@end

@implementation SocialMediaViewController

// Synthesize Variables
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
	// Do any additional setup after loading the view.
    
    // Set Screen Index
    screenIndex = 0;
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"BuildNetworksScreenNames" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    pageTitle.text = [screenNames objectAtIndex:screenIndex];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Button Methods

- (IBAction)openFacebook:(id)sender {
    // URL's
    NSURL *facebookApp = [NSURL URLWithString:@"fb://profile/19357352601"];
    NSURL *facebookWeb = [NSURL URLWithString:@"http://www.facebook.com/Emily.Carr.University"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:facebookApp]) {
        [[UIApplication sharedApplication] openURL:facebookApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:facebookWeb];
    }
}

- (IBAction)openTwitter:(id)sender {
    // URL's
    NSURL *twitterApp = [NSURL URLWithString:@"twitter://user?screen_name=EmilyCarrU"];
    NSURL *twitterWeb = [NSURL URLWithString:@"http://twitter.com/EmilyCarrU"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:twitterApp]) {
        [[UIApplication sharedApplication] openURL:twitterApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:twitterWeb];
    }
}

- (IBAction)openInstagram:(id)sender {
    // URL's
    NSURL *gplusApp = [NSURL URLWithString:@"instagram://user?username=emilycarru"];
    NSURL *gplusWeb = [NSURL URLWithString:@"http://instagram.com/emilycarru#"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:gplusApp]) {
        [[UIApplication sharedApplication] openURL:gplusApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:gplusWeb];
    }
}

- (IBAction)openFlickr:(id)sender {
    // URL's
    NSURL *flickrApp = [NSURL URLWithString:@"flickr://www.flickr.com/photos/emilycarrrecruit/"];
    NSURL *flickrWeb = [NSURL URLWithString:@"http://www.flickr.com/photos/emilycarrrecruit/"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:flickrApp]) {
        [[UIApplication sharedApplication] openURL:flickrApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:flickrWeb];
    }
}

- (IBAction)openPinterest:(id)sender {
    // URL's
    NSURL *pinterestApp = [NSURL URLWithString:@"pinit12://pinterest.com/emilycarru/recruitment-news-events/"];
    NSURL *pinterestWeb = [NSURL URLWithString:@"http://pinterest.com/emilycarru/recruitment-news-events/"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:pinterestApp]) {
        [[UIApplication sharedApplication] openURL:pinterestApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:pinterestWeb];
    }
}

- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}


@end
