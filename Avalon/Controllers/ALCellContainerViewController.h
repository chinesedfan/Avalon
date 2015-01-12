//
//  ALCellContainerViewController.h
//  Avalon
//
//  Created by zhong on 15/1/11.
//  Copyright (c) 2015年 Chinesedfan on Github. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALCellContainerViewController : UIViewController

- (id)initWithRow:(NSInteger)row andCol:(NSInteger)col;
- (void)addCell:(UIView *)cell;

@end
