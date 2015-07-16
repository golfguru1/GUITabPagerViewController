//
//  ViewController.m
//  GUITabPagerViewController
//
//  Created by Guilherme Araújo on 27/02/15.
//  Copyright (c) 2015 Guilherme Araújo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <GUITabPagerDataSource, GUITabPagerDelegate>

@end

@implementation ViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDataSource:self];
    [self setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
    [self selectTabbarIndex:2];
}

#pragma mark - Tab Pager Data Source

- (NSInteger)numberOfViewControllers {
    return 3;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    UIViewController *vc = [UIViewController new];
    [[vc view] setBackgroundColor:[UIColor colorWithRed:arc4random_uniform(255) / 255.0f
                                                  green:arc4random_uniform(255) / 255.0f
                                                   blue:arc4random_uniform(255) / 255.0f alpha:1]];
    return vc;
}

- (UIView *)viewForTabAtIndex:(NSInteger)index {
    //You can return any view here, and play with the frames to adjust spacing between them
    //I have found that using an image with with content mode aspectFit and making the frame by half that of
    //the width of the view works well
    switch (index){
        case 2:{
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 44)];
            view.backgroundColor = [UIColor yellowColor];
            return view;
        }break;
        case 0:{
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 44)];
            view.backgroundColor = [UIColor greenColor];
            return view;
        }break;
        case 1:{
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 44)];
            view.backgroundColor = [UIColor redColor];
            return view;
        }break;
    }
    return [[UIView alloc]init];
}

- (CGFloat)tabHeight {
    // Default: 44.0f
    return 64.0f;
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
    NSLog(@"Will transition from tab %ld to %ld", (long)[self selectedIndex], (long)index);
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
    NSLog(@"Did transition to tab %ld", (long)index);
}

@end
