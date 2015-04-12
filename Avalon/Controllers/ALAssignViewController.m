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
    [self performSegueWithIdentifier:@"AssignView2VoteViewSegue" sender:self];
}

@end
