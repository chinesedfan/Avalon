//
//  ALGame.h
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ALGamePhase) {
    ALGamePhaseLineup,
    ALGamePhasePlayer,
    ALGamePhaseAssign,
    ALGamePhaseExecute,
    ALGamePhaseTask
};

@interface ALGame : NSObject

@property (nonatomic, strong) ALLineup *lineup;

@property (nonatomic, strong) NSArray *playerArray; // ALPlayer[]
@property (nonatomic, assign) NSInteger playerNum;

@property (nonatomic, assign) NSInteger gameRound, assignRound;
@property (nonatomic, assign) NSInteger justiceWins, evilWins;
@property (nonatomic, assign) ALGamePhase gamePhase;

@property (nonatomic, strong) ALPlayer *currentPlayer;
@property (nonatomic, strong) NSArray *executorArray; // ALPlayer[]

+ (ALGame *)instance;
+ (NSInteger)defaultExecutorNumFor:(NSInteger)gameRound withPlayerNum:(NSInteger)playerNum;
+ (NSInteger)defaultFailedLimitFor:(NSInteger)gameRound withPlayerNum:(NSInteger)playerNum;


- (void)configLineup:(ALLineup *)lineup;

- (void)playerConfirmRole;

- (void)configExecutorArray:(NSArray *)executorArray;
- (void)confirmAssignment:(BOOL)isOK;

- (void)playerConfirmExecute:(BOOL)isSuccess;

- (BOOL)hasWonCurrentRound;
- (void)nextGameRound;

@end
