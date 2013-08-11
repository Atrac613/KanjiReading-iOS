//
//  ATJoyoKanjiDao.m
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ATJoyoKanjiDao.h"

@implementation ATJoyoKanjiDao

- (id)init {
    if (self = [super init]) {
        tableName = @"joyo2010";
    }
    
    return self;
}

- (NSString *)setTable:(NSString *)sql {
    return [NSString stringWithFormat:sql, tableName];
}

- (ATCharacter *)getData:(NSString *)character {
    ATCharacter *result = nil;

    FMResultSet *resultSet = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE new_character = ?"], character];
    
    while([resultSet next]){
        result = [[ATCharacter alloc] init];
        result.character = [resultSet stringForColumn:@"new_character"];
        result.oldCharacter = [resultSet stringForColumn:@"old_character"];
        result.addYear = [resultSet intForColumn:@"add_year"];
        result.grade = [resultSet stringForColumn:@"grade"];
        result.totalStrokes = [resultSet intForColumn:@"total_strokes"];
        result.reading = [resultSet stringForColumn:@"reading"];
    }
    
    [resultSet close];
    
    return result;
}

- (NSString *)getReading:(NSString *)character {
    ATCharacter *result = [self getData:character];
    
    if (result) {
        return result.reading;
    } else {
        return nil;
    }
}

@end
