//
//  HandwritingRecognizer.m
//  KanjiReading
//
//  Created by Watanabe Toshinori on 10/12/27.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import "HandwritingRecognizer.h"
#import "HandwritingResult.h"

@implementation HandwritingRecognizer

- (id)initWithCanvas:(UIImageView *)canvas {
	if (self = [super init]) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"handwriting-ja" ofType:@"model"];
        
		recognizer = zinnia_recognizer_new();
		if (!zinnia_recognizer_open(recognizer, [path cStringUsingEncoding:NSASCIIStringEncoding])) {
            fprintf(stderr, "ERROR: %s\n", zinnia_recognizer_strerror(recognizer));
		}
		
		character  = zinnia_character_new();
        
		zinnia_character_clear(character);
		zinnia_character_set_width(character, canvas.frame.size.width);
		zinnia_character_set_height(character, canvas.frame.size.height);
        
		count = 0;
	}
	
	return self;
}

- (NSArray *)classify:(NSArray *)points {
	for (NSValue *value in points) {
		CGPoint point = [value CGPointValue];
		zinnia_character_add(character, count, (int)point.x, (int)point.y);
	}

	zinnia_result_t *result;
	result = zinnia_recognizer_classify(recognizer, character, 5);
	if (result == NULL) {
        fprintf(stderr, "%s\n", zinnia_recognizer_strerror(recognizer));
		return nil;
	}
    
    NSMutableArray *results = [NSMutableArray array];
	for (int i = 0; i < zinnia_result_size(result); ++i) {
		NSString *value = [NSString stringWithCString:zinnia_result_value(result, i) encoding:NSUTF8StringEncoding];
		NSNumber *score = [NSNumber numberWithFloat:zinnia_result_score(result, i)];
        
		HandwritingResult *result = [HandwritingResult new];
		result.value = value;
		result.score = score;
		[results addObject:result];
	}
	zinnia_result_destroy(result);
    
	// Increment line number.
	count ++;
	
	return [NSArray arrayWithArray:results];
}

- (void)clear {
	
	// Reset line number.
	count = 0;
    
	zinnia_character_clear(character);
}

- (void)dealloc {
	zinnia_character_destroy(character);
	zinnia_recognizer_destroy(recognizer);
}

@end
