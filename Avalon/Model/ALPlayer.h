//
//  ALPlayer.h
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALPlayer : NSObject

@property (nonatomic, assign) NSInteger playerId;
@property (nonatomic, strong) ALRole *role;

@property (nonatomic, strong) NSMutableArray *knownArray; // ALPlayer[]

@end
