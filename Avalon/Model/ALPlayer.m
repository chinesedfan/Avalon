//
//  ALPlayer.m
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALPlayer.h"

@implementation ALPlayer

- (id)init {
    self = [super init];
    if (self) {
        _knownArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
