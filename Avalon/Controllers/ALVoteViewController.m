//
//  ALVoteViewController.m
//  Avalon
//
//  Created by zhong on 15/1/18.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALVoteViewController.h"
#import "ALMaskViewController.h"

@implementation ALVoteViewController

- (IBAction)confirmButtonAction:(id)sender {
    [[ALGame instance] confirmAssignment:YES];
    
    [self performSegueWithIdentifier:@"VoteView2MaskViewSegue" sender:self];
}

@end
