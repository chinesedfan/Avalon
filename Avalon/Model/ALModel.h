//
//  ALModel.h
//  Avalon
//
//  Created by zhong on 15/1/10.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALDefinition.h"

typedef NS_ENUM(NSInteger, ALGamePhase) {
    ALGamePhaseLineup,
    ALGamePhasePlayer,
    ALGamePhaseAssign,
    ALGamePhaseExecute,
    ALGamePhaseTask
};

typedef NS_ENUM(NSInteger, ALRoleType) {
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
};

@interface ALRole : NSObject

@property (nonatomic, assign) ALRoleType roleType;
@property (nonatomic, strong, readonly) NSString *roleName;
@property (nonatomic, strong, readonly) NSString *roleImageName;

- (BOOL)canKnow:(ALRole *)otherRole;

+ (id)roleWithRoleType:(ALRoleType)roleType;
+ (NSInteger)defaultRoleNumFor:(ALRoleType)type withPlayerNum:(NSInteger)playerNum;

@end

@interface ALPlayer : NSObject

@property (nonatomic, assign) NSInteger playerId;
@property (nonatomic, strong) ALRole *role;

@property (nonatomic, strong) NSMutableArray *knownArray; // ALPlayer[]

@end

@interface ALLineup : NSObject

@property (nonatomic, strong) NSMutableArray *roleArray; // ALRole[]

- (NSArray *)generatePlayers;

+ (id)lineupWithPlayerNum:(NSInteger)playerNum;

@end