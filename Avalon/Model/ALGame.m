//
//  ALGame.m
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALGame.h"

static ALGame* gALGame = nil;

@interface ALGame()

@property (nonatomic, assign) NSInteger confirmedCount;
@property (nonatomic, assign) NSInteger failedCount;

@end

@implementation ALGame

+ (ALGame *)instance {
    if (!gALGame) {
        gALGame = [[ALGame alloc] init];
    }
    return gALGame;
}

+ (NSInteger)defaultExecutorNumFor:(NSInteger)gameRound withPlayerNum:(NSInteger)playerNum {
    //TODO:
    return 2;
}

+ (NSInteger)defaultFailedLimitFor:(NSInteger)gameRound withPlayerNum:(NSInteger)playerNum {
    //TODO:
    return 1;
}

- (void)configLineup:(ALLineup *)lineup {
    self.lineup = lineup;
    
    self.playerArray = [lineup generatePlayers];
    self.playerNum = self.playerArray.count;
    
    self.gamePhase = ALGamePhasePlayer;
}

- (void)playerConfirmRole {
    self.confirmedCount++;
    if (self.confirmedCount == self.playerNum) {
        [self nextGameRound];
    } else {
        self.currentPlayer = self.playerArray[self.confirmedCount];
    }
}

- (void)configExecutorArray:(NSArray *)executorArray {
    self.executorArray = executorArray;
}

- (void)confirmAssignment:(BOOL)isOK {
    if (isOK) {
        // passed - enter the execute phase
        self.gamePhase = ALGamePhaseExecute;
    } else if (self.assignRound == MAX_ASSIGN_ROUND) {
        // failed and reached the limit - treat as the evil side wins
        self.evilWins++;
        [self nextGameRound];
    } else {
        // failed but not reach the limit - ask the next player to assign
        [self nextAssigner];
        self.assignRound++;
    }
}

- (void)playerConfirmExecute:(BOOL)isSuccess {
    if (!isSuccess) {
        self.failedCount++;
    }
    
    self.confirmedCount++;
    if (self.confirmedCount == self.executorArray.count) {
        self.gamePhase = ALGamePhaseTask;
    } else {
        self.currentExecutor = self.executorArray[self.confirmedCount];
    }
}

- (BOOL)hasWonCurrentRound {
    return (self.failedCount < [ALGame defaultFailedLimitFor:self.gameRound withPlayerNum:self.playerNum]);
}

- (void)nextGameRound {
    self.gameRound++;
    self.gamePhase = ALGamePhaseAssign;
}

- (ALPlayer *)nextAssigner {
    NSInteger playerId = self.currentAssigner.playerId + 1;
    if (playerId == self.playerNum) {
        playerId = 0;
    }
    self.currentAssigner = self.playerArray[playerId];
    return self.currentAssigner;
}

- (void)setGamePhase:(ALGamePhase)gamePhase {
    _gamePhase = gamePhase;
    
    switch (gamePhase) {
        case ALGamePhasePlayer:
            self.confirmedCount = 0;
            self.currentPlayer = self.playerArray[self.confirmedCount];
            break;
        case ALGamePhaseAssign:
            self.assignRound = 1;
            [self nextAssigner];
            break;
        case ALGamePhaseExecute:
            self.failedCount = 0;
            self.confirmedCount = 0;
            self.currentExecutor = self.executorArray[self.confirmedCount];
            break;
        case ALGamePhaseTask:
        default:
            break;
    }
}

@end
