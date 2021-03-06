//
//  AWLNavigationBarController.m
//  IwalaChat
//
//  Created by jinting on 2017/3/13.
//  Copyright © 2017年 Yingmob. All rights reserved.
//

#import "AWLNavigationBarController.h"

@implementation AWLNavigationBarController

+ (void)setup{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage yx_imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].shadowImage = [UIImage yx_imageWithColor:[UIColor colorWithHexString:@"f2f6fa"]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor colorWithHexString:@"334466"], NSForegroundColorAttributeName,
                                                          [UIFont systemFontOfSize:17], NSFontAttributeName,
                                                          nil]];
}

+ (void)setLeftWithNavigationItem:(UINavigationItem *)item imageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName action:(actionBlock)action{
    UIImage *normalImage = [UIImage imageNamed:imageName];
    UIImage *highlightImage = [UIImage imageNamed:highlightImageName];
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, normalImage.size.width+20, normalImage.size.height+20)];
    [backButton setImage:normalImage forState:UIControlStateNormal];
    [backButton setImage:highlightImage forState:UIControlStateHighlighted];
    [backButton bk_addEventHandler:^(id sender) {
        if (action) {
            action();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [backButton bk_addEventHandler:^(id sender) {
        
    } forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    item.leftBarButtonItems = @[[self negativeBarButtonItem],leftItem];
}

+ (void)setLeftWithNavigationItem:(UINavigationItem *)item customView:(UIView *)view{
    CGRect rect = view.bounds;
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width+20, rect.size.height+20)];
    containerView.backgroundColor = [UIColor clearColor];
    [containerView addSubview:view];
    view.center = CGPointMake(containerView.bounds.size.width/2, containerView.bounds.size.height/2);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:containerView];
    
    item.leftBarButtonItems = @[[self negativeBarButtonItem],rightItem];
}

+ (void)setRightWithNavigationItem:(UINavigationItem *)item imageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName action:(actionBlock)action{
    UIImage *normalImage = [UIImage imageNamed:imageName];
    UIImage *highlightImage = [UIImage imageNamed:highlightImageName];
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, normalImage.size.width+20, normalImage.size.height+20)];
    [rightButton setImage:normalImage forState:UIControlStateNormal];
    [rightButton setImage:highlightImage forState:UIControlStateHighlighted];
    [rightButton bk_addEventHandler:^(id sender) {
        if (action) {
            action();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    item.rightBarButtonItems = @[[self negativeBarButtonItem],rightItem];
}

+ (void)setRightWithNavigationItem:(UINavigationItem *)item title:(NSString *)title action:(actionBlock)action{
    UIButton *b = [[UIButton alloc]init];
    [b setTitle:title forState:UIControlStateNormal];
    [b setTitleColor:[UIColor colorWithHexString:@"0067be"] forState:UIControlStateNormal];
    //    [b setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateDisabled];
    b.titleLabel.font = [UIFont systemFontOfSize:13];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:b.titleLabel.font}];
    b.frame = CGRectMake(0, 0, ceilf(size.width)+20, ceilf(size.height)+20);
    [b bk_addEventHandler:^(id sender) {
        if (action) {
            action();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:b];
    item.rightBarButtonItems = @[[self negativeBarButtonItem],rightItem];
}

+ (void)setRightWithNavigationItem:(UINavigationItem *)item customView:(UIView *)view{
    CGRect rect = view.bounds;
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width+20, rect.size.height+20)];
    containerView.backgroundColor = [UIColor clearColor];
    [containerView addSubview:view];
    view.center = CGPointMake(containerView.bounds.size.width/2, containerView.bounds.size.height/2);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:containerView];
    
    item.rightBarButtonItems = @[[self negativeBarButtonItem],rightItem];
}

+ (UIBarButtonItem *)negativeBarButtonItem{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -16;
    return negativeSpacer;
}

+ (void)enableRightNavigationItem:(UINavigationItem *)naviItem{
    for (UIBarButtonItem *item in naviItem.rightBarButtonItems) {
        item.enabled = YES;
    }
}

+ (void)disableRightNavigationItem:(UINavigationItem *)naviItem{
    for (UIBarButtonItem *item in naviItem.rightBarButtonItems) {
        item.enabled = NO;
    }
}

+ (UIButton *)naviButtonForTitle:(NSString *)title {
    UIButton *b = [[UIButton alloc]init];
    [b setImage:[UIImage imageNamed:@"收藏正常态"] forState:UIControlStateNormal];
    //    [b setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateDisabled];
    b.titleLabel.font = [UIFont systemFontOfSize:13];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:b.titleLabel.font}];
    b.frame = CGRectMake(0, 0, ceilf(size.width)+20, ceilf(size.height)+20);
    return b;
}

+ (NSArray *)barButtonItemsForView:(UIView *)view{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    return @[[self negativeBarButtonItem],buttonItem];
}

@end

