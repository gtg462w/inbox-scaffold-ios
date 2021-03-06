//
//  INThreadTableViewCell.m
//  BigSur
//
//  Created by Ben Gotow on 5/1/14.
//  Copyright (c) 2014 Inbox. All rights reserved.
//

#import "INMailItemTableViewCell.h"
#import "NSString+FormatConversion.h"
#import "UIView+FrameAdditions.h"
#import "UIImageView+AFNetworking.h"
#import "INConvenienceCategories.h"
#import "INThemeManager.h"


@implementation INMailItemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier: reuseIdentifier];
	if (self) {
		_participantsLabel = [[INRecipientsLabel alloc] initWithFrame: CGRectZero];
		[_participantsLabel setTextColor: [UIColor colorWithWhite:0.2 alpha:1]];
		[_participantsLabel setTextFont: [UIFont systemFontOfSize: 13]];
		[self.contentView addSubview: _participantsLabel];
		
		_dateLabel = [[UILabel alloc] initWithFrame: CGRectZero];
		[_dateLabel setFont: [UIFont systemFontOfSize: 13]];
		[_dateLabel setTextColor: [UIColor grayColor]];
		[_dateLabel setTextAlignment: NSTextAlignmentRight];
		[self.contentView addSubview: _dateLabel];
		
		_bodyLabel = [[UILabel alloc] initWithFrame: CGRectZero];
		[_bodyLabel setLineBreakMode: NSLineBreakByWordWrapping];
		_subjectLabel = [self textLabel];
		[_subjectLabel setFont: [UIFont boldSystemFontOfSize: 15]];
		[_subjectLabel setContentMode: UIViewContentModeCenter];
		[_subjectLabel removeFromSuperview];
        [self.contentView addSubview:_subjectLabel];
        
		[_bodyLabel setTextColor: [UIColor grayColor]];
		[_bodyLabel setFont: [UIFont systemFontOfSize: 13]];
		[_bodyLabel setNumberOfLines: 2];
		[self.contentView addSubview: _bodyLabel];
	}
	return self;
}

- (float)textLeftInset
{
    return INSETS.left;
}

- (void)layoutSubviews
{
	CGRect f = self.frame;
	
	[super layoutSubviews];
    
	[_dateLabel sizeToFit];
	[_dateLabel in_setFrameOrigin: CGPointMake(f.size.width - INSETS.right - _dateLabel.frame.size.width, INSETS.top)];
	
	float textX = [self textLeftInset];
	float textW = f.size.width - textX - INSETS.right;
		
	[_participantsLabel setFrame: CGRectMake(textX, INSETS.top, _dateLabel.frame.origin.x - textX, 16)];
	[_subjectLabel setFrame: CGRectMake(textX, [_participantsLabel in_bottomRight].y, textW, 20)];
	[_bodyLabel setFrame: CGRectMake(textX, [_subjectLabel in_bottomRight].y, textW, 35)];
	[_bodyLabel sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
