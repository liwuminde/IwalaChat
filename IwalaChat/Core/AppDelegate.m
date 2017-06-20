//
//  AppDelegate.m
//  IwalaChat
//
//  Created by jinting on 2017/3/13.
//  Copyright © 2017年 Yingmob. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GlobalUtils setupCore];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [TestViewController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
