//
//  ATBaseDao.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface ATBaseDao : NSObject {
    FMDatabase *db;
    NSString *tableName;
}

@property (strong, nonatomic) FMDatabase *db;

- (NSString*)setTable:(NSString*)sql;

@end
