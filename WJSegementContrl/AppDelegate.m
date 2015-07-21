//
//  AppDelegate.m
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import "AppDelegate.h"
#import "wjMainViewController.h"
#import "d.h"
#import "a.h"
#import "b.h"
#import "c.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    wjMainViewController* mainView;
    UINavigationController* nav;
    
    a* aView = [[a alloc] init];
    b* bView = [[b alloc] init];
    c* cView = [[c alloc] init];
    d* dView = [[d alloc] init];
    
    UIViewController* addView = [[UIViewController alloc] init];
    addView.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController* add2View = [[UIViewController alloc] init];
    add2View.view.backgroundColor = [UIColor greenColor];
    
    UIViewController* add3View = [[UIViewController alloc] init];
    add3View.view.backgroundColor = [UIColor blueColor];
    
    UIViewController* add4View = [[UIViewController alloc] init];
    add4View.view.backgroundColor = [UIColor lightGrayColor];

    
     mainView = [wjMainViewController wjSegemtnContrl];
    mainView.scroSpeed = 0.1;  //滑块移动的速度  默认为 0.3
    mainView.sliderType = sliderDefault;  //设置滑块属性
    nav = [[UINavigationController alloc] initWithRootViewController:mainView];
    nav.navigationBar.translucent = NO;
    
    [mainView addSegementContrl:aView];
    [mainView addSegementContrl:bView];
    [mainView addSegementContrl:dView];
    [mainView addSegementContrl:cView];
    [mainView addSegementContrl:addView];
    [mainView addSegementContrl:add2View];
    [mainView addSegementContrl:add3View];
    [mainView addSegementContrl:add4View];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
   
    // Override point for customization after application launch.
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
