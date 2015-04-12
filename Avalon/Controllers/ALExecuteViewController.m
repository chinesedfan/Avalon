//
//  ALExecuteViewController.m
//  Avalon
//
//  Created by zhong on 15/1/18.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALExecuteViewController.h"
#import "ALMaskViewController.h"

@implementation ALExecuteViewController

- (IBAction)confirmButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"ExecuteView2MaskViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ALMaskViewController *maskViewController = segue.destinationViewController;
    maskViewController.gamePhase = ALGamePhaseTask;
}

@end
