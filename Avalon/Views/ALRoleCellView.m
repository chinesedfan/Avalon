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
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *increaseButton;
@property (weak, nonatomic) IBOutlet UIButton *decreaseButton;

@end

@implementation ALRoleCellView

- (void)updateWithRole:(ALRole *)role {
    self.nameLabel.text = role.roleName;
}

@end
