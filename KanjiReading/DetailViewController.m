//
//  DetailViewController.m
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize character;
@synthesize characterLabel;
@synthesize gradeLabel;
@synthesize readingLabel;
@synthesize totalStrokesLabel;
@synthesize shareLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    characterLabel.text = character.character;
    readingLabel.text = character.reading;
    
    if ([character.grade isEqualToString:@"7S"]) {
        gradeLabel.text = @"中学校以降";
    } else {
        gradeLabel.text = [NSString stringWithFormat:@"小学校 %@ 年生", character.grade];
    }
    
    totalStrokesLabel.text = [NSString stringWithFormat:@"%d 画", character.totalStrokes];
    
    shareLabel.text = NSLocalizedString(@"SHARE", @"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 2) {
        NSString *message = [NSString stringWithFormat:@"%@ - %@ via #KanjiReading", character.character, character.reading];
        
        [self openInOtherApps:message];
    }
}

#pragma mark - UIActivityViewController

- (void)openInOtherApps:(NSString*)message {
    NSArray *actItems = [NSArray arrayWithObjects:message, nil];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:actItems applicationActivities:nil];
    activityView.excludedActivityTypes = @[UIActivityTypeAssignToContact];
    
    activityView.completionHandler = ^(NSString *activityType, BOOL completed){
        NSLog(@"Activity Type: %@", activityType);
        
        if (completed) {
            NSLog(@"Done.");
        } else {
            NSLog(@"Failed.");
        }
        
    };
    
    [self presentViewController:activityView animated:YES completion:nil];
}

@end
