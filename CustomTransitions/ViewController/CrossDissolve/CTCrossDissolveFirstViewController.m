//
//  CTCrossDissolveFirstViewController.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/15.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTCrossDissolveFirstViewController.h"
#import "CTCrossDissolveSecondViewController.h"
#import "CTCrossDissolveTransitionAnimator.h"

@interface CTCrossDissolveFirstViewController ()<UIViewControllerTransitioningDelegate> //1，必须遵守协议
@property (nonatomic) UILabel *label;
@property (nonatomic) UIButton *presentBtn;
@end

@implementation CTCrossDissolveFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLabel];
    [self addPresentButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIViewControllerTransitioningDelegate
// 2, 执行代理方法
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [CTCrossDissolveTransitionAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [CTCrossDissolveTransitionAnimator new];
}

#pragma mark Methods
- (void)addPresentButton {
     self.presentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.presentBtn setTitle:@"Present Second View Controller" forState:UIControlStateNormal];
    [self.view addSubview:self.presentBtn];
    [self.presentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(-20);
    }];
    [self.presentBtn bk_addEventHandler:^(id sender) {
        CTCrossDissolveSecondViewController *secondViewController = [CTCrossDissolveSecondViewController new];
        secondViewController.transitioningDelegate = self; // 3, 设置代理方
        secondViewController.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:secondViewController animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)addLabel {
    self.label = [UILabel new];
    self.label.text = @"A";
    self.label.font = [UIFont systemFontOfSize:120];
    self.label.textColor = [UIColor customGrayColor];
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
    }];
}


@end
