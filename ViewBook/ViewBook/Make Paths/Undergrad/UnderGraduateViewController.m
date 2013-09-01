//
//  UnderGraduateViewController.m
//  ViewBook
//
//  Created by Pandita on 2013-08-23.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "UnderGraduateViewController.h"

@interface UnderGraduateViewController ()

@property (copy,nonatomic) NSArray *courses;
@property(nonatomic) NSInteger swipeCount;

@end

@implementation UnderGraduateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)back:(id)sender {
[   self dismissViewControllerAnimated:YES completion:nil];
}





- (void)viewDidUnload {

    [super viewDidUnload];
}
@end
