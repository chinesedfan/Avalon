//
//  ALPlayerCellView.m
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALPlayerCellView.h"

@implementation ALPlayerCellView {
    NSInteger _playerId;
}

- (id)initWithPlayerId:(NSInteger)playerId {
    self = [super init];
    if (self) {
        _playerId = playerId;
    }
    return self;
}

- (void)configIdLabel {
    UILabel *idLabel = [[UILabel alloc] init];
    idLabel.text = i2s(_playerId);
    [self addSubview:idLabel];
}

@end
