//
//  MasterViewController.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandwritingRecognizer.h"

@interface MasterViewController : UIViewController {
    IBOutlet UIImageView *canvas;
	
	NSOperationQueue *queue;
    CGPoint touchPoint;
	NSMutableArray *points;
	HandwritingRecognizer *recognizer;
}

@property (nonatomic, retain) IBOutlet UIImageView *canvas;
@property (nonatomic, retain) NSOperationQueue *queue;
@property (nonatomic, assign) CGPoint touchPoint;
@property (nonatomic, retain) NSMutableArray *points;
@property (nonatomic, retain) HandwritingRecognizer *recognizer;

- (IBAction)clearButtonPressed:(id)sender;

@end
