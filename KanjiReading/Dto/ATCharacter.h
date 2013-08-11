//
//  ATCharacter.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCharacter : NSObject {
    NSString *character;
    NSString *oldCharacter;
    NSInteger totalStrokes;
    NSString *grade;
    NSInteger addYear;
    NSString *reading;
}

@property (strong, nonatomic) NSString *character;
@property (strong, nonatomic) NSString *oldCharacter;
@property (nonatomic) NSInteger totalStrokes;
@property (strong, nonatomic) NSString *grade;
@property (nonatomic) NSInteger addYear;
@property (strong, nonatomic) NSString *reading;

@end
