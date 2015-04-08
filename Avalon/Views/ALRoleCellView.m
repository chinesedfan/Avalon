//
//  ALRoleCellView.m
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALRoleCellView.h"

@interface ALRoleCellView ()

// UI
@property (nonatomic, strong) UIImageView *roleImageView;
@property (nonatomic, strong) UIButton *increaseButton;
@property (nonatomic, strong) UIButton *decreaseButton;

@end

@implementation ALRoleCellView

- (id)initWithRole:(ALRole *)role {
    self = [super init];
    if (self) {
        self.role = role;

        [self configSubviews];
        [self configConstraints];
    }
    return self;
}

- (void)configSubviews {
    self.roleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.role.roleImageName]];
    [self addSubview:self.roleImageView];
    
    self.increaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.increaseButton addTarget:self action:@selector(increaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.increaseButton];
    
    self.decreaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.decreaseButton addTarget:self action:@selector(decreaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.decreaseButton];
    
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
    self.roleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.increaseButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.decreaseButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self.roleImageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(self.roleImageView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self.roleImageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(self.roleImageView)]];[self reuseIdentifier];
}

@end
