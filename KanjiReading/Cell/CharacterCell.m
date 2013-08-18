//
//  CharacterCell.m
//  KanjiReading
//
//  Created by Osamu Noguchi on 8/18/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "CharacterCell.h"

@implementation CharacterCell

@synthesize characterLabel;
@synthesize characterReadingLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        characterLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 30, 30)];
        [characterLabel setBackgroundColor:[UIColor clearColor]];
        [characterLabel setFont:[UIFont boldSystemFontOfSize:26.f]];
        [characterLabel setTextColor:[UIColor blackColor]];
        [self addSubview:characterLabel];
        
        characterReadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 8, 260, 30)];
        [characterReadingLabel setBackgroundColor:[UIColor clearColor]];
        [characterReadingLabel setFont:[UIFont systemFontOfSize:16.f]];
        [characterReadingLabel setTextColor:[UIColor blackColor]];
        [self addSubview:characterReadingLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
