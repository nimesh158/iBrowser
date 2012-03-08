//
//  BrowserAppDelegate.h
//  Browser
//
//  Created by NIMESH DESAI on 9/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BrowserViewController;

@interface BrowserAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BrowserViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BrowserViewController *viewController;

@end

