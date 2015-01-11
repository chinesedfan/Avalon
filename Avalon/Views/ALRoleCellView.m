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
    
    UIImageView *_roleImage;
    UIButton *_increaseButton;
    UIButton *_decreaseButton;
}

- (id)initWithRole:(ALRole *)role {
    self = [super init];
    if (self) {
        _role = role;
    }
    return self;
}

- (void)config {
    _roleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_role.roleImageName]];
    [self addSubview:_roleImage];
    
    _increaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_increaseButton addTarget:self action:@selector(increaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_increaseButton];
    
    _decreaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_decreaseButton addTarget:self action:@selector(decreaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_decreaseButton];
}

- (void)increaseButtonAction:(UIButton *)sender {
    // TODO:
}

- (void)decreaseButtonAction:(UIButton *)sender {
    // TODO:
}

@end
