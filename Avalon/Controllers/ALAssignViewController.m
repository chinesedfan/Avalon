//
//  ALAssignViewController.m
//  Avalon
//
//  Created by zhong on 15/1/18.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALAssignViewController.h"
#import "ALMaskViewController.h"

@implementation ALAssignViewController

- (IBAction)confirmButtonAction:(id)sender {
    NSArray *playerArray = [ALGame instance].playerArray;
    NSArray *executorArray = [NSArray arrayWithObjects:playerArray[0], playerArray[1], nil];
    [[ALGame instance] configExecutorArray:executorArray];
    
    [self performSegueWithIdentifier:@"AssignView2VoteViewSegue" sender:self];
}

@end
