//
//  CharacterCell.h
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/18/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterCell : UITableViewCell {
    UILabel *characterLabel;
    UILabel *characterReadingLabel;
}

@property (strong, nonatomic) UILabel *characterLabel;
@property (strong, nonatomic) UILabel *characterReadingLabel;

@end
