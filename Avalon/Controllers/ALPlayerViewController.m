//
//  ALPlayerViewController.m
//  Avalon
//
//  Created by zhong on 15/1/12.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALPlayerViewController.h"
#import "ALCellContainerViewController.h"

@implementation ALPlayerViewController {
    ALCellContainerViewController *_cellContainerViewController;
}

- (void)viewDidLoad {
    
}

- (void)configSubviews {
    _cellContainerViewController = [[ALCellContainerViewController alloc] initWithRow:5 andCol:2];
    [self.view addSubview:_cellContainerViewController.view];
}

@end
