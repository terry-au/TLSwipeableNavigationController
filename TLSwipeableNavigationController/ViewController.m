//
//  ViewController.m
//  TLSwipeableNavigationController
//
//  Created by Terry Lewis on 17/1/17.
//  Copyright (c) 2017 terry1994. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    UIButton *_button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat r = (CGFLOAT_TYPE)(arc4random() % 100) / 100;
    CGFloat g = (CGFLOAT_TYPE)(arc4random() % 100) / 100;
    CGFloat b = (CGFLOAT_TYPE)(arc4random() % 100) / 100;
    UIColor *backgroundColour = [UIColor colorWithRed:r green:g blue:b alpha:1];
    UIColor *buttonColour = [UIColor colorWithRed:1-r green:1-g blue:1-b alpha:1];
    self.view.backgroundColor = backgroundColour;

    _button = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button setTitleColor:buttonColour forState:UIControlStateNormal];
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [_button setTitle:@"Next View Controller" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(navigateToNextController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];

    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:_button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraints:@[centerX, centerY]];
}

- (void)navigateToNextController:(id)navigateToNextController {
    ViewController *viewController = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
