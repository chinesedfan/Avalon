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
    self.confirmedCount = 0;
    self.currentPlayer = self.playerArray[self.confirmedCount];
}

- (void)playerConfirmRole {
    self.confirmedCount++;
    if (self.confirmedCount == self.playerNum) {
        self.gamePhase = ALGamePhaseAssign;
        self.gameRound = 1;
        self.assignRound = 1;
        self.currentPlayer = self.playerArray[0];
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
        self.failedCount = 0;
        self.confirmedCount = 0;
    } else if (self.assignRound == MAX_ASSIGN_ROUND) {
        // failed and reached the limit - treat as the evil side wins
        self.evilWins++;
        [self nextGameRound];
    } else {
        // failed but not reach the limit - ask the next player to assign
        [self nextPlayer];
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
        self.currentPlayer = self.playerArray[self.confirmedCount];
    }
}

- (BOOL)hasWonCurrentRound {
    return YES;
}

- (void)nextGameRound {
    self.gameRound++;
    self.gamePhase = ALGamePhaseAssign;
    self.assignRound = 1;
    [self nextPlayer];
}

- (ALPlayer *)nextPlayer {
    NSInteger playerId = self.currentPlayer.playerId + 1;
    if (playerId == self.playerNum) {
        playerId = 0;
    }
    self.currentPlayer = self.playerArray[playerId];
    return self.currentPlayer;
}

@end
