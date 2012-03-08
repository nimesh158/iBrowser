//
//  BrowserAppDelegate.m
//  Browser
//
//  Created by NIMESH DESAI on 9/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "BrowserAppDelegate.h"
#import "BrowserViewController.h"

@implementation BrowserAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
