//
//  RecruitmentCalendarViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "RecruitmentCalendarViewController.h"
#import "RecruitmentCalenderCell.h"


@interface RecruitmentCalendarViewController ()

@end

@implementation RecruitmentCalendarViewController

// Synthesize Variables
@synthesize eventTimes;
@synthesize table;



//- (id)initWithStyle:(UITableViewStyle)style {
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Table Size
    CGFloat startingPoint = 44.0;
    CGRect tableRect = self.view.bounds;
    tableRect.origin.y = startingPoint;
    tableRect.size.height -= startingPoint;
    
    self.table = [[UITableView alloc] initWithFrame:tableRect style:UITableViewStyleGrouped];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.table.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.table];
    
    if ([self.table respondsToSelector:@selector(setBackgroundView:)]) {
        self.table.backgroundView = nil;
    }
    self.table.backgroundColor = [UIColor whiteColor];
    
    // Array To Populate Table
    self.eventTimes = [[NSMutableArray alloc]init];

    // XML Path
    NSString *URLString = @"http://www.jesses.co.tt/storage/recruitments.xml";
    NSURL *URL = [NSURL URLWithString: [URLString stringByAddingPercentEscapesUsingEncoding:
                   NSASCIIStringEncoding]];
    
    // Cast XML into Data
    NSData *xmlData = [NSData dataWithContentsOfURL:URL];
    
    // Save File
    NSString *applicationDocumentsDir =
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *storePath = [applicationDocumentsDir stringByAppendingPathComponent:@"recruitments.xml"];
    [xmlData writeToFile:storePath atomically:TRUE];
    
    // Read Data
    NSData *savedXML = [NSData dataWithContentsOfFile:storePath];
    
    // Parse XML
    NSXMLParser *NSXmlParser = [[NSXMLParser alloc] initWithData:savedXML];
    
    XMLParser *xmlParser = [[XMLParser alloc] initXMLParser];
    
    [NSXmlParser setDelegate:xmlParser];
    
    [NSXmlParser parse];
    
    //BOOL success = [NSXmlParser parse];
    //NSLog(@"Was The Parser Successful? ... %d", success);
    //NSLog(@"Able To Get These Events: %@", [xmlParser cumulativeEvents]);
    
    for (NSString *event in [xmlParser cumulativeEvents]) {
        //NSLog(@"This Is An Event: %@", event);
        [self.eventTimes addObject:event];
    }
    
    for (NSString *date in self.eventTimes) {
        //NSLog(@"Final Array values: %@", date);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// TABLE STUFF

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.eventTimes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";

    RecruitmentCalenderCell *calenderCell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!calenderCell) {
        calenderCell = [[RecruitmentCalenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    calenderCell.textLabel.text = [self.eventTimes objectAtIndex:indexPath.row];
    [calenderCell.textLabel setFont:[UIFont systemFontOfSize:18]];
    
    // Buttons
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect ];
    saveButton.frame = CGRectMake(0, 0, 50, 35);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [saveButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [saveButton addTarget:self action:@selector(savePressed:) forControlEvents:UIControlEventTouchUpInside];
    calenderCell.accessoryView = saveButton;
    
    [calenderCell setIndentationWidth:0];
    [calenderCell setIndentationLevel:0];
           
    return calenderCell;
}

//RX Button Click action
-(void)savePressed:(UIButton *)sender {
    UITableViewCell *cell = ((UITableViewCell *)[sender superview]);
    NSInteger cellRow = [[self.table indexPathForCell:cell] row];
    //NSLog(@"Button Number: %i",cellRow);
    [self createLocalNotifications:cell rowNumber:cellRow];
}

//RX Creates multiple Local Notifications 
-(void)createLocalNotifications:(UITableViewCell *)currentCell rowNumber:(NSInteger)rowNumber {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy hh:mm"];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    
    //NSDate *date = [self.eventTimes objectAtIndex:rowNumber];
    NSString *baseDate = [self.eventTimes objectAtIndex:rowNumber];
    NSString *trimmedDate = [baseDate substringToIndex:17];
    //NSLog(@"Trimmed %@", trimmedDate);
    NSDate *date = [dateFormatter dateFromString:trimmedDate];
    //NSDate *date = [dateFormatter dateFromString:@"Aug 27 2013 12:30"];
    //NSLog(@"date: %@", date);
    
    NSString *message = @"Your Emily Carr University event happening now! ";

    [self scheduleLocalNotificationWithDate:date: message];
    
}

//RX creates local notification
-(void)scheduleLocalNotificationWithDate:(NSDate *)fireDate :(NSString *)alertMessage {
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    
    notification.fireDate = fireDate;
    notification.alertBody = alertMessage;
    //notification.repeatInterval = NSDayCalendarUnit;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    [self showMessage:@"This date has been saved."];
    
}

//RX Creates alert to notify user that notification has been set
- (void)showMessage:(NSString *)bodyTexts {
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Reminder"
                                                     message :bodyTexts
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"The Index Is %i", indexPath.row);
    //NSLog(@"The Text Is %@", [self.eventTimes objectAtIndex:indexPath.row]);
}

- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}

@end
