//
//  KanjiReadingTests.m
//  KanjiReadingTests
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "KanjiReadingTests.h"

@implementation KanjiReadingTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGetCharacter
{
    ATJoyoKanjiDao *test = [[ATJoyoKanjiDao alloc] init];
    
    STAssertNotNil([test getReading:@"一"], @"Character not found.");
}

@end
