//
//  AppDelegate.m
//  Demo
//
//  Created by Mo Bitar on 8/21/13.
//  Copyright (c) 2013 progenius. All rights reserved.
//

#import "AppDelegate.h"
#import "Zuckerkit.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
   sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if([url.absoluteString rangeOfString:@"fb"].location != NSNotFound) {
        return [[Zuckerkit sharedInstance] handleOpenUrl:url];
    }
    return NO;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[Zuckerkit sharedInstance] handleDidBecomeActive];
}

@end
