//
//  ALMaskViewController.m
//  Avalon
//
//  Created by zhong on 15/1/18.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALMaskViewController.h"

@interface ALMaskViewController ()

// UI
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UIButton *goNextButton;

// Data
@property (nonatomic, strong) NSString *segueId;

@end

@implementation ALMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gamePhase = self.gamePhase;
}

- (void)setGamePhase:(ALGamePhase)gamePhase {
    _gamePhase = gamePhase;
    
    switch (gamePhase) {
        case ALGamePhasePlayer:
            self.tipsLabel.text = @"Pass to Player x to confirm the role.";
            self.segueId = @"MaskView2PlayerViewSegue";
            break;
        case ALGamePhaseAssign:
            self.tipsLabel.text = @"Welcome Player x to assgin task participators.";
            self.segueId = @"MaskView2AssignViewSegue";
            break;
        case ALGamePhaseExecute:
            self.tipsLabel.text = @"Allow Player x to execute the task.";
            self.segueId = @"MaskView2ExecuteViewSegue";
            break;
        case ALGamePhaseTask:
            self.tipsLabel.text = @"Let's witness the result.";
            self.segueId = @"MaskView2TaskViewSegue";
        default:
            break;
    }
}

- (IBAction)goNextButtonAction:(id)sender {
    [self performSegueWithIdentifier:self.segueId sender:self];
}

@end
