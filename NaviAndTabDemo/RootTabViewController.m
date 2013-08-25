//
//  RootTabViewController.m
//  NaviAndTabDemo
//
//  Created by ligf on 13-8-16.
//  Copyright (c) 2013年 yonyou. All rights reserved.
//

#import "RootTabViewController.h"

#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@interface RootTabViewController ()

@end

@implementation RootTabViewController
@synthesize firstViewController = _firstViewController;
@synthesize secondViewController = _secondViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureTabBar];
    
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    {
        if (IPHONE5)
        {
            [_firstViewController.tblFirst setFrame:CGRectMake(0, 0, 320, 455)];
        }
        else
        {
            [_firstViewController.tblFirst setFrame:CGRectMake(0, 0, 320, 367)];
        }
        
    }
    else
    {
        // use this mehod on ios6
        if (IPHONE5)
        {
            [_firstViewController.tblFirst setFrame:CGRectMake(0, -20, 320, 518)];
        }
        else
        {
            [_firstViewController.tblFirst setFrame:CGRectMake(0, -20, 320, 430)];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    self.firstViewController = nil;
    self.secondViewController = nil;
    
    [super viewDidUnload];
}

- (void)dealloc
{
    [_firstViewController release];
    [_secondViewController release];
    
    [super dealloc];
}

- (void)configureTabBar
{
    // first
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tab_first_nor" ofType:@"png"];
    self.firstViewController = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    _firstViewController.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"First"
                                                                          image:[UIImage imageWithContentsOfFile:filePath]
                                                                            tag:0] autorelease];
    
    // second
    filePath = [[NSBundle mainBundle] pathForResource:@"tab_second_nor" ofType:@"png"];
    self.secondViewController = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
    _secondViewController.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Second" image:[UIImage imageWithContentsOfFile:filePath] tag:1] autorelease];
    
    self.viewControllers = [NSArray arrayWithObjects:_firstViewController,_secondViewController, nil];
}

//==============================================================================
#pragma mark - tabBar代理

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    self.title = item.title;
    if (item.tag == 0)  
    {
        if (IPHONE5)
        {
            [_firstViewController.tblFirst setFrame:CGRectMake(0, 0, 320, 455)];
        }
        else
        {
            [_firstViewController.tblFirst setFrame:CGRectMake(0, 0, 320, 367)];
        }
    }
    else if(item.tag == 1) 
    {
        
    }
}

@end
