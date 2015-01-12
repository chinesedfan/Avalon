//
//  ALModel.m
//  Avalon
//
//  Created by zhong on 15/1/10.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALModel.h"

@implementation ALRole

- (BOOL)isKnown:(ALRole *)otherRole {
    ALRoleType otherType = otherRole.roleType;
    switch (_roleType) {
        case ALRoleTypeMerlin:
            return (otherType == ALRoleTypeMorgana || otherType == ALRoleTypeOberon ||
                    otherType == ALRoleTypeAssassinator || otherType == ALRoleTypePawn);
        case ALRoleTypePercival:
            return (otherType == ALRoleTypeMerlin || otherType == ALRoleTypeMorgana);
        case ALRoleTypeMorgana:
        case ALRoleTypeAssassinator:
        case ALRoleTypeMordred:
        case ALRoleTypePawn:
            return (otherType != _roleType) && (otherType == ALRoleTypeMorgana ||
                    otherType == ALRoleTypeAssassinator || otherType == ALRoleTypePawn);
        default:
            return NO;
    }
}

+ (id)roleWithRoleType:(ALRoleType)roleType {
    ALRole *role = [[ALRole alloc] init];
    role.roleType = roleType;
    return role;
}

+ (NSInteger)getRoleNumFor:(ALRoleType)type withPlayerNum:(NSInteger)playerNum {
    NSAssert((playerNum < MIN_PLAYER_NUM || playerNum >= MAX_PLAYER_NUM), @"Unsupported player num: %ld", playerNum);
    
    // The Player Num:  5 6 7 8 9 10
    // The Authur's:    3 4 4 5 6 6
    // The Mordred's:   2 2 3 3 3 4
    NSDictionary *roleNumMap = @{
        @(ALRoleTypeMerlin):    @[@1, @1, @1, @1, @1, @1],
        @(ALRoleTypePercival):  @[@0, @0, @1, @1, @1, @1],
        @(ALRoleTypeLoyalist):  @[@2, @3, @2, @3, @4, @4],
        
        @(ALRoleTypeMorgana):       @[@0, @0, @1, @1, @1, @1],
        @(ALRoleTypeAssassinator):  @[@1, @1, @1, @1, @1, @1],
        @(ALRoleTypeMordred):       @[@0, @0, @0, @0, @0, @1],
        @(ALRoleTypeOberon):        @[@0, @0, @0, @0, @0, @1],
        @(ALRoleTypePawn):          @[@1, @1, @1, @1, @1, @0]
    };
    
    NSArray *roleNumArray = [roleNumMap objectForKey:[NSNumber numberWithInteger:type]];
    return [roleNumArray[playerNum - MIN_PLAYER_NUM] integerValue];
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
    NSAssert((playerNum < MIN_PLAYER_NUM || playerNum >= MAX_PLAYER_NUM), @"Unsupported player num: %ld", playerNum);
    
    ALLineup *lineup = [[ALLineup alloc] init];
    for (ALRoleType i = 0; i < ALRoleTypeMax; i++) {
        NSInteger roleCount = [ALRole getRoleNumFor:i withPlayerNum:playerNum];
        for (NSInteger j = 0; j < roleCount; j++) {
            ALRole *role = [ALRole roleWithRoleType:i];
            [lineup.roleArray addObject:role];
        }
    }
    return lineup;
}

@end
