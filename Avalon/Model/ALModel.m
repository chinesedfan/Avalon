//
//  ALModel.m
//  Avalon
//
//  Created by zhong on 15/1/10.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALModel.h"

@implementation ALRole

- (BOOL)canKnow:(ALRole *)otherRole {
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

- (void)setRoleType:(ALRoleType)roleType {
    switch (roleType) {
        case ALRoleTypeMerlin:
            _roleName = @"Merlin";
            break;
        case ALRoleTypePercival:
            _roleName = @"Percival";
            break;
        case ALRoleTypeLoyalist:
            _roleName = @"Loyalist";
            break;
        case ALRoleTypeMorgana:
            _roleName = @"Morgana";
            break;
        case ALRoleTypeAssassinator:
            _roleName = @"Assassinator";
            break;
        case ALRoleTypeMordred:
            _roleName = @"Mordred";
            break;
        case ALRoleTypeOberon:
            _roleName = @"Oberon";
            break;
        case ALRoleTypePawn:
            _roleName = @"Pawn";
            break;
        default:
            _roleName = @"Unkown";
            break;
    }
}

+ (id)roleWithRoleType:(ALRoleType)roleType {
    ALRole *role = [[ALRole alloc] init];
    role.roleType = roleType;
    return role;
}

+ (NSInteger)defaultRoleNumFor:(ALRoleType)type withPlayerNum:(NSInteger)playerNum {
    NSAssert((playerNum >= MIN_PLAYER_NUM && playerNum <= MAX_PLAYER_NUM), @"Unsupported player num: %ld", playerNum);
    
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

- (id)init {
    self = [super init];
    if (self) {
        _knownArray = [[NSMutableArray alloc] init];
    }
    return self;
}

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
