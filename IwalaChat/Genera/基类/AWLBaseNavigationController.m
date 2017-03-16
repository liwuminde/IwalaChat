//
//  AWLBaseNavigationController.m
//  IwalaChat
//
//  Created by jinting on 2017/3/13.
//  Copyright © 2017年 Yingmob. All rights reserved.
//

#import "AWLBaseNavigationController.h"

@interface AWLBaseNavigationController ()

@end

@implementation AWLBaseNavigationController
- (void)viewDidLoad
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                
                                kLPAWhiteTextColor,
                                
                                NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17],NSFontAttributeName, nil];
    [self.navigationBar setTitleTextAttributes:attributes];
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
@end
