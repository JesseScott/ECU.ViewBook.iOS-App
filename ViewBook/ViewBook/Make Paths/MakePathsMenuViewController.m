//
//  MakePathsMenuViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-31.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "MakePathsMenuViewController.h"

@interface MakePathsMenuViewController ()

@end

@implementation MakePathsMenuViewController

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"pushToGraduateCourses"]) {
        UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
    else if([segue.identifier isEqualToString:@"pushToCSCourses"]) {
        UIViewController *controller = (UIViewController *)segue.destinationViewController;
    }
}

- (IBAction)launchUndergrad:(id)sender {
    
}

- (IBAction)launchGraduate:(id)sender {
    [self performSegueWithIdentifier:@"pushToGraduateCourses" sender:sender];
}

- (IBAction)launchCS:(id)sender {
    [self performSegueWithIdentifier:@"pushToCSCourses" sender:sender];
}
@end
