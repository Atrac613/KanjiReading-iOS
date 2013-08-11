//
//  ThirdPartyNoticesViewController.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdPartyNoticesViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UINavigationItem *navigationItem;
    IBOutlet UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UINavigationItem *navigationItem;
@property (nonatomic, retain) IBOutlet UIWebView *webView;

- (void)cancelButtonPressed;

@end
