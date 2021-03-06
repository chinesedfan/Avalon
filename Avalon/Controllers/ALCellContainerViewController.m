//
//  ALCellContainerViewController.m
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALCellContainerViewController.h"

@implementation ALCellContainerViewController {
    NSMutableArray *_cellArray; // UIView[]
    
    NSInteger _row, _col;
}

- (id)initWithRow:(NSInteger)row andCol:(NSInteger)col {
    NSAssert(row > 0, @"Row=%ld should be greater than 0.", row);
    NSAssert(col > 0, @"Col=%ld should be greater than 0.", col);
    
    self = [super init];
    if (self) {
        _cellArray = [[NSMutableArray alloc] init];
        _row = row;
        _col = col;
    }
    return self;
}

- (void)viewDidLoad {
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)addCell:(UIView *)cell {
    NSAssert(cell, @"Invalid cell");
    NSAssert(_cellArray.count < _row*_col, @"Reached the limit of cells.");
    
    [self.view addSubview:cell];
    
    // width and height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0/_col constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0/_row constant:0]];
    
    // top and left
    NSInteger curRow = _cellArray.count/_col, curCol = _cellArray.count%_col;
    if (curRow > 0) {
        UIView *topView = _cellArray[_cellArray.count - _col];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topView][cell]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(topView, cell)]];
    } else {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[cell]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(cell)]];
    }
    
    if (curCol > 0) {
        UIView *leftView = _cellArray[_cellArray.count - 1];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[leftView][cell]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(leftView, cell)]];
    } else {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[cell]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(cell)]];
    }
    
    // save in the array
    [_cellArray addObject:cell];
}

- (void)reset {
    [_cellArray removeAllObjects];
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
