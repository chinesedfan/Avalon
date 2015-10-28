//
//  ALRole.m
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALRole.h"

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
