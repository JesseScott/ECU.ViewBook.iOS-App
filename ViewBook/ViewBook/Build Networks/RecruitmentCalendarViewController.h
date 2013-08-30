//
//  RecruitmentCalendarViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface RecruitmentCalendarViewController : UITableViewController {
    
    // Screen Index
    NSInteger screenIndex;
    
    
}

@property (strong, nonatomic) NSMutableArray *eventTimes;

// Back To Main Menu
- (IBAction)back:(id)sender;

@end
