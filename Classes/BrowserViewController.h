//
//  BrowserViewController.h
//  Browser
//
//  Created by NIMESH DESAI on 9/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController <UIWebViewDelegate, UITextFieldDelegate>
{
	IBOutlet UITextField* urlField;
	IBOutlet UIWebView* webView;
	IBOutlet UIActivityIndicatorView* activityIndicator;
}

-(IBAction)handleGoTapped;
-(IBAction)goBack:(id)sender;
-(IBAction)goForward:(id)sender;

@end

