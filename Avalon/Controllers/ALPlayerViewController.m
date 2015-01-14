//
//  ALPlayerViewController.m
//  Avalon
//
//  Created by zhong on 15/1/12.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALPlayerViewController.h"
#import "ALCellContainerViewController.h"
#import "ALPlayerCellView.h"

@implementation ALPlayerViewController {

    __weak IBOutlet UILabel *_roleTipsLabel;
    ALCellContainerViewController *_cellContainerViewController;
    
    NSArray *_playerArray; // ALPlayer[]
    NSInteger _currentPlayerIndex;
}

- (void)viewDidLoad {
    [self configSubviews];
    [self configConstraints];
    
    [self showPlayerInfo];
}

- (void)configSubviews {
    _cellContainerViewController = [[ALCellContainerViewController alloc] initWithRow:2 andCol:2];
    [self.view addSubview:_cellContainerViewController.view];
}

- (void)configConstraints {
    NSDictionary *vs = @{
                         @"tipsLabel": _roleTipsLabel,
                         @"containerView": _cellContainerViewController.view
                         };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[tipsLabel][containerView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:vs]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[containerView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:vs]];
}

- (void)setLineup:(ALLineup *)lineup {
    _lineup = lineup;
    _playerArray = [lineup generatePlayers];
    _currentPlayerIndex = -1;
}

- (void)showPlayerInfo {
    _currentPlayerIndex++;
    [_cellContainerViewController reset];
    
    ALPlayer *player = _playerArray[_currentPlayerIndex];
    for (NSInteger i = 0; i < player.knownArray.count; i++) {
        ALPlayer *other = player.knownArray[i];
        ALPlayerCellView *playerCellView = [[ALPlayerCellView alloc] initWithPlayerId:other.playerId];
        [_cellContainerViewController addCell:playerCellView];
    }
}

@end
