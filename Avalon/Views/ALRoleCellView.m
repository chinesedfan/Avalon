//
//  ALRoleCellView.m
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALRoleCellView.h"

@implementation ALRoleCellView {
    ALRole *_role;
    
    UIImageView *_roleImageView;
    UIButton *_increaseButton;
    UIButton *_decreaseButton;
}

- (id)initWithRole:(ALRole *)role {
    self = [super init];
    if (self) {
        _role = role;

        [self configSubviews];
        [self configConstraints];
    }
    return self;
}

- (void)configSubviews {
    _roleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_role.roleImageName]];
    [self addSubview:_roleImageView];
    
    _increaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_increaseButton addTarget:self action:@selector(increaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_increaseButton];
    
    _decreaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_decreaseButton addTarget:self action:@selector(decreaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_decreaseButton];
    
    self.backgroundColor = [UIColor blueColor];
}

- (void)increaseButtonAction:(UIButton *)sender {
    // TODO:
}

- (void)decreaseButtonAction:(UIButton *)sender {
    // TODO:
}

- (void)configConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    _roleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _increaseButton.translatesAutoresizingMaskIntoConstraints = NO;
    _decreaseButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_roleImageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_roleImageView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_roleImageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_roleImageView)]];
}

@end
