//
//  ALTaskViewController.m
//  Avalon
//
//  Created by zhong on 15/1/18.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALTaskViewController.h"
#import "ALMaskViewController.h"

@implementation ALTaskViewController

- (IBAction)confirmButtonAction:(id)sender {
    [[ALGame instance] nextGameRound];
    
    [self performSegueWithIdentifier:@"TaskView2MaskViewSegue" sender:self];
}

@end
