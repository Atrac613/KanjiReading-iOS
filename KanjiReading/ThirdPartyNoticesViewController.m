//
//  ThirdPartyNoticesViewController.m
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ThirdPartyNoticesViewController.h"

@interface ThirdPartyNoticesViewController ()

@end

@implementation ThirdPartyNoticesViewController

@synthesize navigationItem;
@synthesize webView;

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
	
    [self.navigationItem setTitle:NSLocalizedString(@"LICENSE", @"")];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"CLOSE", @"") style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonPressed)]];
    
    [webView setDelegate:self];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"third_party_notices" ofType:@"html"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancelButtonPressed {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
