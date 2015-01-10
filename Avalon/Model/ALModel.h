//
//  ALModel.h
//  Avalon
//
//  Created by zhong on 15/1/10.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    // the Author's
    ALRoleTypeMerlin,
    ALRoleTypePercival,
    ALRoleTypeLoyalist,
    // the Mordred's
    ALRoleTypeMorgana,
    ALRoleTypeAssassinator,
    ALRoleTypeMordred,
    ALRoleTypeOberon,
    ALRoleTypePawn,
    // the max
    ALRoleTypeMax
} ALRoleType;

@interface ALRole : NSObject

@property (nonatomic, assign) ALRoleType roleType;
@property (nonatomic, strong) NSString *roleName;

- (BOOL)isKnown:(ALRole *)otherRole;

+ (id)initWithRoleType:(ALRoleType)roleType;
+ (NSInteger)getRoleNumFor:(ALRoleType) type withPlayerNum:(NSInteger)playerNum;

@end

@interface ALPlayer : NSObject

@property (nonatomic, assign) NSInteger playerId;
@property (nonatomic, strong) ALRole *role;

@property (nonatomic, strong) NSMutableArray *knownArray; // ALPlayer[]

@end

@interface ALLineup : NSObject

@property (nonatomic, strong) NSMutableArray *roleArray; // ALRole[]

- (NSArray *)generatePlayers;

+ (id)getDefaultLineupByPlayerNum:(NSInteger)playerNum;

@end