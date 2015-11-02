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
    [[ALGame instance] playerConfirmExecute:YES];
    
    [self performSegueWithIdentifier:@"ExecuteView2MaskViewSegue" sender:self];
}

@end
