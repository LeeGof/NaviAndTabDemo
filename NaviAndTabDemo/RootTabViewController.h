//
//  RootTabViewController.h
//  NaviAndTabDemo
//
//  Created by ligf on 13-8-16.
//  Copyright (c) 2013年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface RootTabViewController : UITabBarController<UITabBarDelegate>
{
    FirstViewController         *_firstViewController;
    SecondViewController        *_secondViewController;
}

@property (nonatomic,retain) FirstViewController *firstViewController;
@property (nonatomic,retain) SecondViewController *secondViewController;

@end
