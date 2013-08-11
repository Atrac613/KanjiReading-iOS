//
//  AboutViewController.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface AboutViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SKStoreProductViewControllerDelegate> {
    IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
