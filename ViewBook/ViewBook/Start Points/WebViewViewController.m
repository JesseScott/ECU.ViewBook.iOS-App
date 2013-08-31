//
//  WebViewViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "WebViewViewController.h"
#import "VideoThumbnailViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController

// Synthesize Variables
@synthesize webView, vimeoURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithURL:(NSString*)url {
    vimeoURL = [[NSString alloc] initWithString:url];
    //NSLog(@"The URL received is %@", vimeoURL);
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    //
    if ([UIDevice instancesRespondToSelector:@selector(setOrientation:)]) {
        //[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationPortrait];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        
    // Embed the Video
    [self embedVimeo];

    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ((toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)) {
        return YES;
    }
    else {
        return NO;
    }
}




-(void)embedVimeo {
    
    NSString *pre = @"<iframe width=\"300\" height=\"250\" src=\"http://player.vimeo.com/video/";
    NSString *post = @"\" frameborder=\"0\" allowfullscreen></iframe>";
    
    NSString *embedHTML = [NSString stringWithFormat:@"%@%@%@", pre, vimeoURL, post];
    
    [webView loadHTMLString:embedHTML baseURL:nil];
}


- (IBAction)backToThumbnails:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
