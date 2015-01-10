//
//  ALModel.m
//  Avalon
//
//  Created by zhong on 15/1/10.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALModel.h"

static NSArray *kKnownRoleTypeMap = nil;

@implementation ALRole

- (BOOL)isKnown:(ALRole *)otherRole {
    NSArray *knownArray = kKnownRoleTypeMap[_roleType];
    for (NSInteger i = 0; i < knownArray.count; i++) {
        NSInteger type = [knownArray[i] integerValue];
        if (otherRole.roleType == type) {
            return YES;
        }
    }
    return false;
}

+ (id)initWithRoleType:(ALRoleType)roleType {
    ALRole *role = [[ALRole alloc] init];
    role.roleType = roleType;
    return role;
}

+ (NSInteger)getRoleNumByPlayerNum:(NSInteger)playerNum {
    // TODO:
    return 0;
}

@end

@implementation ALPlayer

@end

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
    }
    
    // different players know different players
    for (NSInteger i = 0; i < playerArray.count; i++) {
        ALPlayer *player = playerArray[i];
        for (NSInteger j = 0; j < playerArray.count; j++) {
            ALPlayer *other = playerArray[j];
            if ([player.role isKnown:other.role]) {
                [player.knownArray addObject:other];
            }
        }
    }
    
    return playerArray;
}

- (void)swapRoles {
    // TODO: exchange the sequences of roles
}

+ (id)getDefaultLineupByPlayerNum:(NSInteger)playerNum {
    if (playerNum < MIN_PLAYER_NUM || playerNum >= MAX_PLAYER_NUM) {
        NSLog(@"Unsupported player num: %ld", playerNum);
        return nil;
    }
    
    ALLineup *lineup = [[ALLineup alloc] init];
    for (ALRoleType i = 0; i < ALRoleTypeMax; i++) {
        NSInteger roleCount = [ALRole getRoleNumByPlayerNum:playerNum];
        for (NSInteger j = 0; j < roleCount; j++) {
            ALRole *role = [ALRole initWithRoleType:i];
            [lineup.roleArray addObject:role];
        }
    }
    return lineup;
}

@end
