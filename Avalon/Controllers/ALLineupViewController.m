//
//  ALLineupViewController.m
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import "ALLineupViewController.h"

@implementation ALLineupViewController {
    __weak IBOutlet UIButton *_defaultLineupButton;
    __weak IBOutlet UIButton *_customizedLineupButton;
    __weak IBOutlet UIButton *_confirmButton;
    
    __weak IBOutlet UIPickerView *_playerNumPicker;
}

- (void)viewDidLoad {
    [self configConstraints];
}

- (void)configConstraints {
    NSDictionary *vs = @{
            @"defaultBtn": _defaultLineupButton,
            @"customizedBtn": _customizedLineupButton,
            @"confirmBtn": _confirmButton,
            @"numPicker": _playerNumPicker
    };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[defaultBtn][numPicker][confirmBtn]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:vs]];
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
    // TODO:
}

@end
