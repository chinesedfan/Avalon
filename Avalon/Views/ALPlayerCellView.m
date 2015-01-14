//
//  ALPlayerCellView.m
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALPlayerCellView.h"

@implementation ALPlayerCellView {
    UILabel *_playerIdLabel;
    
    NSInteger _playerId;
}

- (id)initWithPlayerId:(NSInteger)playerId {
    self = [super init];
    if (self) {
        _playerId = playerId;
        
        [self configSubviews];
        [self configConstraints];
    }
    return self;
}

- (void)configSubviews {
    _playerIdLabel = [[UILabel alloc] init];
    _playerIdLabel.text = i2s(_playerId);
    [self addSubview:_playerIdLabel];
}

- (void)configConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    _playerIdLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_playerIdLabel]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_playerIdLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_playerIdLabel]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_playerIdLabel)]];
}

@end
