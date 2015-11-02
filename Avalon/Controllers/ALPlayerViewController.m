//
//  ALPlayerViewController.m
//  Avalon
//
//  Created by zhong on 15/1/12.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALPlayerViewController.h"
#import "ALMaskViewController.h"
#import "ALPlayerCellView.h"

@interface ALPlayerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *roleTipsLabel;

@end

@implementation ALPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configWithPlayer:[ALGame instance].currentPlayer];
}

- (void)configWithPlayer:(ALPlayer *)player {
    self.roleTipsLabel.text = [NSString stringWithFormat:@"Player %@", @(player.playerId)];
}

- (IBAction)confirmButtonAction:(id)sender {
    [[ALGame instance] playerConfirmRole];
    
    [self performSegueWithIdentifier:@"PlayerView2MaskViewSegue" sender:self];
}

@end
