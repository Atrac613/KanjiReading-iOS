//
//  HandwritingResult.h
//  KanjiReading
//
//  Created by Watanabe Toshinori on 10/12/27.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HandwritingResult : NSObject {
    NSString *value;
	NSNumber *score;
}

@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSNumber *score;

@end
