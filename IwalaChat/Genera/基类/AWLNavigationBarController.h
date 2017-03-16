//
//  AWLNavigationBarController.h
//  IwalaChat
//
//  Created by jinting on 2017/3/13.
//  Copyright © 2017年 Yingmob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^actionBlock)();

@interface AWLNavigationBarController : NSObject

+ (void)setup;

+ (void)setLeftWithNavigationItem:(UINavigationItem *)item imageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName action:(actionBlock)action;

+ (void)setLeftWithNavigationItem:(UINavigationItem *)item customView:(UIView *)view;

+ (void)setRightWithNavigationItem:(UINavigationItem *)item imageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName action:(actionBlock)action;

+ (void)setRightWithNavigationItem:(UINavigationItem *)item title:(NSString *)title action:(actionBlock)action;

+ (void)setRightWithNavigationItem:(UINavigationItem *)item customView:(UIView *)view;

+ (void)enableRightNavigationItem:(UINavigationItem *)naviItem;
+ (void)disableRightNavigationItem:(UINavigationItem *)naviItem;

// 以下2方法目前仅为附件收藏使用，其它地方不要使用
+ (UIButton *)naviButtonForTitle:(NSString *)title;
+ (NSArray *)barButtonItemsForView:(UIView *)view;

@end
