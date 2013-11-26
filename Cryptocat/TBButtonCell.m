//
//  TBButtonCell.m
//  Cryptocat
//
//  Created by Thomas Balthazar on 05/11/13.
//  Copyright (c) 2013 Thomas Balthazar. All rights reserved.
//

#import "TBButtonCell.h"

#define kDisabledTitleColor [UIColor colorWithWhite:0.718 alpha:1.000]

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TBButtonCell ()

@property (nonatomic, strong) UILabel *label;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TBButtonCell

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder *)aDecoder {
  if (self=[super initWithCoder:aDecoder]) {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _label = [[UILabel alloc] init];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:18.0];
    [self.contentView addSubview:_label];
  }
  TBLOGMARK;

  return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)awakeFromNib {
  [super awakeFromNib];
  TBLOGMARK;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  TBLOGMARK;
  
  self.label.highlighted = selected;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
  [super layoutSubviews];
  TBLOGMARK;

  self.label.frame = self.contentView.frame;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public Methods

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTitle:(NSString *)title {
  TBLOGMARK;
  self.label.text  = title;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)title {
  TBLOGMARK;
  return self.label.text;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTitleColor:(UIColor *)titleColor {
  _titleColor = titleColor;
  self.label.textColor = titleColor;
  self.label.highlightedTextColor = [titleColor colorWithAlphaComponent:0.5];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setEnabled:(BOOL)enabled {
  _enabled = enabled;
  self.label.textColor = enabled ? self.titleColor : kDisabledTitleColor;
}

@end
