//
//  ATBaseDao.m
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ATBaseDao.h"

@implementation ATBaseDao

@synthesize db;

- (id)init{
    if (self = [super init]) {
        NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"kanji_reading" ofType:@"db"];
        
        db = [FMDatabase databaseWithPath:dbPath];
        if ([db open]) {
            NSLog(@"Database open.");
            
            [db setTraceExecution:YES];
        } else {
            NSLog(@"Failed to open database.");
        }
    }
    
    return self;
}

- (NSString*)setTable:(NSString*)sql {
    return nil;
}

@end
