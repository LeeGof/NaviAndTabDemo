//
//  AppDelegate.m
//  NaviAndTabDemo
//
//  Created by ligf on 13-8-16.
//  Copyright (c) 2013年 yonyou. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_navCtrl release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    RootTabViewController *rootTabBarView = [[[RootTabViewController alloc] init] autorelease];
    rootTabBarView.title = @"First";
    _navCtrl = [[UINavigationController alloc] initWithRootViewController:rootTabBarView];
    
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    UIImage *backgroundImage = [UIImage imageNamed:@"nav_bg.png"];
    if (version >= 5.0)
    {
        [self.navCtrl.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    }
    
    UIImageView *iv = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroud.png"]] autorelease];
    [self.window addSubview:iv];
    self.window.rootViewController = _navCtrl;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
