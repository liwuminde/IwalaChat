//
//  AWLBaseViewController.m
//  IwalaChat
//
//  Created by jinting on 2017/3/13.
//  Copyright © 2017年 Yingmob. All rights reserved.
//

#import "AWLBaseViewController.h"

@interface AWLBaseViewController ()

@end

@implementation AWLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSArray *vcArray = self.navigationController.viewControllers;
    if (!isEmpty(vcArray)) {
        if (vcArray[0] != self) {
            [self setupLeftBack];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Navi Left
- (void)setupLeftBack{
    [self setupLeftWithImageNamed:@"返回按钮" highlightImageNamed:@"返回按钮点击态"];
}

- (void)setupLeftWithImageNamed:(NSString *)imageName highlightImageNamed:(NSString *)highlightImageName{
    @weakify(self);
    [AWLNavigationBarController setLeftWithNavigationItem:self.navigationItem imageName:imageName highlightImageName:highlightImageName action:^{
        @strongify(self);
        [self naviLeftAction];
    }];
}

- (void)setupLeftWithCustomView:(UIView *)view{
    [AWLNavigationBarController setLeftWithNavigationItem:self.navigationItem customView:view];
}

- (void)naviLeftAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navi Right
- (void)setupRightWithImageNamed:(NSString *)imageName highlightImageNamed:(NSString *)highlightImageName{
    @weakify(self);
    [AWLNavigationBarController setRightWithNavigationItem:self.navigationItem imageName:imageName highlightImageName:highlightImageName action:^{
        @strongify(self);
        [self naviRightAction];
    }];
}

- (void)setupRightWithCustomView:(UIView *)view{
    [AWLNavigationBarController setRightWithNavigationItem:self.navigationItem customView:view];
}

- (void)setupRightWithTitle:(NSString *)title{
    @weakify(self);
    [AWLNavigationBarController setRightWithNavigationItem:self.navigationItem title:title action:^{
        @strongify(self);
        [self naviRightAction];
    }];
}

- (void)naviRightAction{
    
}

#pragma mark - 提示
- (void)startLoading{
    [AWLNavigationBarController disableRightNavigationItem:self.navigationItem];
    [[HUDHelper sharedInstance] syncLoading];
}

- (void)stopLoading{
    [AWLNavigationBarController enableRightNavigationItem:self.navigationItem];
    [[HUDHelper sharedInstance] syncStopLoading];
}

- (void)showToast:(NSString *)text{
    [[HUDHelper sharedInstance] tipMessage:text];
}

@end
