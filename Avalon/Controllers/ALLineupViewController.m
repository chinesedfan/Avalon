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
#import "ALMaskViewController.h"

@interface ALLineupViewController ()

// UI
@property (weak, nonatomic) IBOutlet UIButton *defaultLineupButton;
@property (weak, nonatomic) IBOutlet UIButton *customizedLineupButton;
@property (weak, nonatomic) IBOutlet UIPickerView *playerNumPicker;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UICollectionView *roleCollectionView;

// Data
@property (nonatomic, strong) ALLineup *lineup;

@end

@implementation ALLineupViewController

- (void)viewDidLoad {
    [self.roleCollectionView registerNib:[UINib nibWithNibName:@"ALRoleCellView" bundle:nil]  forCellWithReuseIdentifier:@"idALRoleCellView"];
    
    [self updatePlayerNum:MIN_PLAYER_NUM];
}

- (void)updatePlayerNum:(NSInteger)playerNum {
    NSAssert((playerNum >= MIN_PLAYER_NUM && playerNum <= MAX_PLAYER_NUM), @"Unsupported player num: %ld", playerNum);
    
    self.lineup = [ALLineup lineupWithPlayerNum:playerNum];
    [self.roleCollectionView reloadData];
}

#pragma mark - Action Handlers
- (IBAction)confirmButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"LineupView2MaskViewSegue" sender:self];
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

#pragma mark - CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.lineup.roleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ALRoleCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"idALRoleCellView" forIndexPath:indexPath];
    [cell updateWithRole:self.lineup.roleArray[indexPath.row]];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - CollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //TODO:
}

@end
