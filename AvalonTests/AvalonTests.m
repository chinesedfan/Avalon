//
//  AvalonTests.m
//  AvalonTests
//
//  Created by zhong on 15/1/9.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ALDefinition.h"
#import "ALRole.h"
#import "ALPlayer.h"
#import "ALLineup.h"
#import "ALGame.h"

@interface AvalonTests : XCTestCase

@property (nonatomic, strong) ALGame *game;

@end

@implementation AvalonTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testGame {
    self.game = [ALGame instance];
    
    [self.game configLineup:[ALLineup lineupWithPlayerNum:5]];
    
    for (NSInteger i = 0; i < self.game.playerNum; i++) {
        XCTAssertEqual(ALGamePhasePlayer, self.game.gamePhase);
        XCTAssertEqual(i, self.game.currentPlayer.playerId);
        [self.game playerConfirmRole];
    }
    
    NSArray *playerArray = self.game.playerArray;
    NSArray *executorArray = [NSArray arrayWithObjects:playerArray[0], playerArray[1], nil];
    
    // player 0 assigns, failed
    XCTAssertEqual(ALGamePhaseAssign, self.game.gamePhase);
    XCTAssertEqual(1, self.game.currentAssigner.playerId);
    [self.game configExecutorArray:executorArray];
    [self.game confirmAssignment:NO];
    
    // player 1 assigns, passed
    XCTAssertEqual(ALGamePhaseAssign, self.game.gamePhase);
    XCTAssertEqual(2, self.game.currentAssigner.playerId);
    [self.game configExecutorArray:executorArray];
    [self.game confirmAssignment:YES];
    
    // execute and failed
    for (NSInteger i = 0; i < self.game.executorArray.count; i++) {
        XCTAssertEqual(ALGamePhaseExecute, self.game.gamePhase);
        XCTAssertEqual(i, self.game.currentExecutor.playerId);
        [self.game playerConfirmExecute:NO];
    }
    XCTAssertEqual(ALGamePhaseTask, self.game.gamePhase);
    XCTAssertEqual(NO, [self.game hasWonCurrentRound]);
    [self.game nextGameRound];
    
    // player 2 assigns, passed
    XCTAssertEqual(ALGamePhaseAssign, self.game.gamePhase);
    XCTAssertEqual(3, self.game.currentAssigner.playerId);
    [self.game configExecutorArray:executorArray];
    [self.game confirmAssignment:YES];
    
    // execute and win
    for (NSInteger i = 0; i < self.game.executorArray.count; i++) {
        XCTAssertEqual(ALGamePhaseExecute, self.game.gamePhase);
        XCTAssertEqual(i, self.game.currentExecutor.playerId);
        [self.game playerConfirmExecute:YES];
    }
    XCTAssertEqual(ALGamePhaseTask, self.game.gamePhase);
    XCTAssertEqual(YES, [self.game hasWonCurrentRound]);
    [self.game nextGameRound];
}

@end
