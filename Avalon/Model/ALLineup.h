//
//  ALLineup.h
//  Avalon
//
//  Created by zhong on 15/10/28.
//  Copyright © 2015年 Chinesedfan on Github. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALLineup : NSObject

@property (nonatomic, strong) NSMutableArray *roleArray; // ALRole[]

- (NSArray *)generatePlayers;

+ (id)lineupWithPlayerNum:(NSInteger)playerNum;

@end
