//
//  GroupedTableViewCell.m
//  GroupedTable
//
//  Copyright (c) 2013 Johnnie Walker
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "GroupedTableViewCell.h"

@implementation GroupedTableViewCell

- (void)commonInit {
    // Initialization code
    self.backgroundView = [[UIImageView alloc] initWithImage:nil highlightedImage:nil];
    self.backgroundView.contentMode = UIViewContentModeScaleToFill;

    self.backgroundImageEdgeInsets = UIEdgeInsetsMake(4.0, 4.0, 4.0, 4.0);    
    self.position = GroupedTableViewCellPositionTop;
    
    self.textLabel.font = [UIFont boldSystemFontOfSize:14.0];		
    self.textLabel.backgroundColor = [UIColor clearColor];
            
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setSelected:NO];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        [self commonInit];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {	
    [super setSelected:selected animated:animated];
    
	[(UIImageView *)self.backgroundView setHighlighted:selected];	
	
    self.textLabel.shadowOffset = (selected) ? CGSizeMake(0, -1.0) : CGSizeMake(0, 0.5);
    self.textLabel.textColor = (selected) ? [UIColor colorWithWhite:0.800 alpha:1.000] : [UIColor colorWithWhite:0.200 alpha:1.000];
    self.textLabel.shadowColor = (selected) ? [UIColor colorWithWhite:0.098 alpha:1.000] : [UIColor colorWithWhite:0.702 alpha:1.000];
}

- (void)setBackgroundImageEdgeInsets:(UIEdgeInsets)backgroundImageEdgeInsets {
    if (UIEdgeInsetsEqualToEdgeInsets(backgroundImageEdgeInsets, _backgroundImageEdgeInsets)) return;
    
    _backgroundImageEdgeInsets = backgroundImageEdgeInsets;
    
    GroupedTableViewCellPosition position = self.position;
    self.position = GroupedTableViewCellPositionUnknown;
    self.position = position;
}

- (void)setPosition:(GroupedTableViewCellPosition)value {	
    if (_position != value) {
        
        UIImage *backgroundImage = nil;
        UIImage *highlightedBackgroundImage = nil;
        UIEdgeInsets insets = self.backgroundImageEdgeInsets;

		switch (value) {
			case GroupedTableViewCellPositionTop:
				backgroundImage = [[UIImage imageNamed:@"GroupedTableTopCellBackground.png"] resizableImageWithCapInsets:insets];
				highlightedBackgroundImage = [[UIImage imageNamed:@"GroupedTableTopCellBackgroundHighlighted.png"] resizableImageWithCapInsets:insets];
				
				break;
			case GroupedTableViewCellPositionMiddle:
				backgroundImage = [[UIImage imageNamed:@"GroupedTableMiddleCellBackground.png"] resizableImageWithCapInsets:insets];								   
				highlightedBackgroundImage = [[UIImage imageNamed:@"GroupedTableMiddleCellBackgroundHighlighted.png"] resizableImageWithCapInsets:insets];											  
				
				break;
			case GroupedTableViewCellPositionBottom:
				backgroundImage = [[UIImage imageNamed:@"GroupedTableBottomCellBackground.png"] resizableImageWithCapInsets:insets];								   
				highlightedBackgroundImage = [[UIImage imageNamed:@"GroupedTableBottomCellBackgroundHighlighted.png"] resizableImageWithCapInsets:insets];											  
				
				break;
			case GroupedTableViewCellPositionFull:
				backgroundImage = [[UIImage imageNamed:@"GroupedTableFullCellBackground.png"] resizableImageWithCapInsets:insets];
				highlightedBackgroundImage = [[UIImage imageNamed:@"GroupedTableFullCellBackgroundHighlighted.png"] resizableImageWithCapInsets:insets];
				break;
			default:
				break;
		}
		
		[(UIImageView *)[self backgroundView] setImage:backgroundImage];
		[(UIImageView *)[self backgroundView] setHighlightedImage:highlightedBackgroundImage];		
		
		_position = value;
		
		[self setNeedsDisplay];
    }
}

@end
;