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

@end
