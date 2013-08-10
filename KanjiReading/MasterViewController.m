//
//  MasterViewController.m
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/10/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "MasterViewController.h"
#import "HandwritingResult.h"

@interface MasterViewController () {
    
}

@end

@implementation MasterViewController

@synthesize canvas;
@synthesize queue;
@synthesize touchPoint;
@synthesize points;
@synthesize recognizer;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.queue = [[NSOperationQueue alloc] init];
	[queue setMaxConcurrentOperationCount:1];
	self.recognizer = [[HandwritingRecognizer alloc] initWithCanvas:canvas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)clearButtonPressed:(id)sender {
	[recognizer clear];
	
	[queue cancelAllOperations];
	
	canvas.image = nil;
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	self.points = [NSMutableArray array];
	
    UITouch *touch = [touches anyObject];
    self.touchPoint = [touch locationInView:canvas];
	
	[points addObject:[NSValue valueWithCGPoint:CGPointMake((int)touchPoint.x, (int)touchPoint.y)]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:canvas];
    
    UIGraphicsBeginImageContext(canvas.frame.size);
    
    [canvas.image drawInRect:CGRectMake(0, 0, canvas.frame.size.width, canvas.frame.size.height)];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
	
	[points addObject:[NSValue valueWithCGPoint:CGPointMake((int)currentPoint.x, (int)currentPoint.y)]];
    
    self.touchPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[queue addOperationWithBlock:^{
        
		NSArray *results = [recognizer classify:points];

		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			if (results) {
				for (int i = 0; i < [results count]; i++) {
					HandwritingResult *result = [results objectAtIndex:i];
                    NSLog(@"%@ (%@)", result.value, result.score);
				}
			}
		}];
	}];
}

@end
