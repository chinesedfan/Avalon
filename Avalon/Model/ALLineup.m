//
//  ALLineup.m
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALLineup.h"

@implementation ALLineup

- (id)init {
    self = [super init];
    if (self) {
        _roleArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)generatePlayers {
    // exchange the sequences of roles
    [self swapRoles];
    
    // each player obtains a role
    NSMutableArray *playerArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < _roleArray.count; i++) {
        ALPlayer *player = [[ALPlayer alloc] init];
        player.playerId = i;
        player.role = _roleArray[i];
        [playerArray addObject:player];
    }
    
    // different players know different players
    for (NSInteger i = 0; i < playerArray.count; i++) {
        ALPlayer *player = playerArray[i];
        for (NSInteger j = 0; j < playerArray.count; j++) {
            ALPlayer *other = playerArray[j];
            if ([player.role canKnow:other.role]) {
                [player.knownArray addObject:other];
            }
        }
    }
    
    return playerArray;
}

- (void)swapRoles {
    // TODO: exchange the sequences of roles
}

+ (id)lineupWithPlayerNum:(NSInteger)playerNum {
    NSAssert((playerNum >= MIN_PLAYER_NUM && playerNum <= MAX_PLAYER_NUM), @"Unsupported player num: %ld", playerNum);
    
    ALLineup *lineup = [[ALLineup alloc] init];
    for (ALRoleType i = 0; i < ALRoleTypeMax; i++) {
        NSInteger roleCount = [ALRole defaultRoleNumFor:i withPlayerNum:playerNum];
        for (NSInteger j = 0; j < roleCount; j++) {
            ALRole *role = [ALRole roleWithRoleType:i];
            [lineup.roleArray addObject:role];
        }
    }
    return lineup;
}

@end
