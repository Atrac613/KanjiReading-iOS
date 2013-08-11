//
//  DetailViewController.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATCharacter.h"

@interface DetailViewController : UITableViewController {
    ATCharacter *character;
    
    IBOutlet UILabel *characterLabel;
    IBOutlet UILabel *readingLabel;
    IBOutlet UILabel *gradeLabel;
    IBOutlet UILabel *totalStrokesLabel;
    IBOutlet UILabel *shareLabel;
}

@property (strong, nonatomic) ATCharacter *character;
@property (strong, nonatomic) IBOutlet UILabel *characterLabel;
@property (strong, nonatomic) IBOutlet UILabel *readingLabel;
@property (strong, nonatomic) IBOutlet UILabel *gradeLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalStrokesLabel;
@property (strong, nonatomic) IBOutlet UILabel *shareLabel;

@end
