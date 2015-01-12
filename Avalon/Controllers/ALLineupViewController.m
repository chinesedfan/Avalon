//
//  ALLineupViewController.m
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALLineupViewController.h"
#import "ALCellContainerViewController.h"
#import "ALRoleCellView.h"
#import "ALPlayerViewController.h"

@implementation ALLineupViewController {
    // UI
    __weak IBOutlet UIButton *_defaultLineupButton;
    __weak IBOutlet UIButton *_customizedLineupButton;
    __weak IBOutlet UIButton *_confirmButton;
    
    __weak IBOutlet UIPickerView *_playerNumPicker;
    
    ALCellContainerViewController *_cellContainerViewController;
    
    // Data
    ALLineup *_lineup;
}

- (void)viewDidLoad {
    [self configSubviews];
    [self configConstraints];
}

- (void)configSubviews {
    _cellContainerViewController = [[ALCellContainerViewController alloc] initWithRow:5 andCol:2];
    [self.view addSubview:_cellContainerViewController.view];
}

- (void)configConstraints {
    NSDictionary *vs = @{
            @"defaultBtn": _defaultLineupButton,
            @"customizedBtn": _customizedLineupButton,
            @"confirmBtn": _confirmButton,
            @"numPicker": _playerNumPicker,
            @"containerView": _cellContainerViewController.view
    };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[defaultBtn][numPicker][confirmBtn]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:vs]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[containerView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:vs]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[numPicker][containerView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:vs]];
}

- (void)updatePlayerNum:(NSInteger)playerNum {
    NSAssert((playerNum >= MIN_PLAYER_NUM && playerNum <= MAX_PLAYER_NUM), @"Unsupported player num: %ld", playerNum);
    
    _lineup = [ALLineup getDefaultLineupByPlayerNum:playerNum];
    [_cellContainerViewController reset];
    for (NSInteger i = 0; i < _lineup.roleArray.count; i++) {
        ALRole *role = _lineup.roleArray[i];
        ALRoleCellView *roleCellView = [[ALRoleCellView alloc] initWithRole:role];
        [_cellContainerViewController addCell:roleCellView];
    }
}

#pragma mark - PickerView DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return MAX_PLAYER_NUM - MIN_PLAYER_NUM + 1;
}

#pragma mark - PickerView Delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return i2s(row + MIN_PLAYER_NUM);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self updatePlayerNum:row + MIN_PLAYER_NUM];
}

#pragma mark - Action Handlers
- (IBAction)confirmButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"LineupView2PlayerViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ALPlayerViewController *playerViewController = segue.destinationViewController;
    playerViewController.lineup = _lineup;
}

@end
