//
//  ALRole.h
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import <Foundation/Foundation.h>

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
