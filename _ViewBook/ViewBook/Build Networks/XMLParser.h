//
//  XMLParser.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-22.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSXMLParser.h>

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
//    NSMutableString *currentEvent;
//    NSMutableArray *cumulativeEvents;
    
}

// Methods
-(XMLParser *)initXMLParser;

//
@property (nonatomic, retain) NSMutableString *currentEvent;
@property (strong, nonatomic) NSMutableArray *cumulativeEvents;


@end
