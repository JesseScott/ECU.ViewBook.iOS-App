//
//  ViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-07-13.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "SplashViewController.h"
#import "MainMenuViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

// Synthesize Properties
@synthesize timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    // Load Image
    splashImage = [[UIImage alloc] init];
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ([UIScreen mainScreen].scale == 2.f && screenHeight == 568.0f) {
        splashImage = [UIImage imageNamed:@"splash_page-568h.png"];
    } else {
        splashImage = [UIImage imageNamed:@"splash_page.png"];
    }
    
    // Create ImageView
    splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    //splashView = [[UIImageView alloc] initWithImage:splashImage];
    splashView.image = splashImage;
    
    // Assign ImageView To UIView
    [self.view addSubview:splashView];
    */
    
    // Timer
    if(self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(switchView) userInfo:nil repeats:NO];
    }
    
    
    
}

// Switch View
- (void) switchView {
    
    // Load New Storyboard
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
    
    // Kill Timer
    [timer invalidate];
    self.timer = nil;       
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
