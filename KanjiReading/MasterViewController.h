//
//  MasterViewController.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandwritingRecognizer.h"
#import "ATJoyoKanjiDao.h"

@interface MasterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UIImageView *canvas;
    IBOutlet UITableView *tableView;
	
	NSOperationQueue *queue;
    CGPoint touchPoint;
	NSMutableArray *points;
	HandwritingRecognizer *recognizer;
    
    ATJoyoKanjiDao *kanji;
    NSArray *results;
}

@property (strong, nonatomic) IBOutlet UIImageView *canvas;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (nonatomic) CGPoint touchPoint;
@property (strong, nonatomic) NSMutableArray *points;
@property (strong, nonatomic) HandwritingRecognizer *recognizer;
@property (strong, nonatomic) ATJoyoKanjiDao *kanji;
@property (strong, nonatomic) NSArray *results;

- (IBAction)clearButtonPressed:(id)sender;

@end
