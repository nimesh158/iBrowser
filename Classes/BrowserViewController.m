//
//  BrowserViewController.m
//  Browser
//
//  Created by NIMESH DESAI on 9/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "BrowserViewController.h"

@implementation BrowserViewController

-(void) loadURL
{
	NSURL *url = [[NSURL alloc] initWithString: urlField.text];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
	[webView loadRequest: request];
	[request release];
	[url release];
}

-(IBAction) handleGoTapped
{
	[urlField resignFirstResponder];
	[self loadURL];
}

-(IBAction)goBack:(id)sender
{
	[webView goBack];
}

-(IBAction)goForward:(id)sender
{
	[webView goForward];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if (textField == urlField)
	{
		[self handleGoTapped];
	}
	return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	webView.scalesPageToFit = YES;
	return YES;
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
	if (navigationType == UIWebViewNavigationTypeLinkClicked)
	{
		NSURL* URL = [request URL];	
		if ([[URL scheme] isEqualToString:@"http"])
		{
			NSLog(@"url scheme is getting checked");
			[urlField setText:[URL absoluteString]];
			[self handleGoTapped];
		}	 
		return NO;
	}	
	return YES;   
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	NSLog(@"web page started loading");
	[activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webview
{
	NSLog(@"web page finished loading");
	[activityIndicator stopAnimating];
	NSString* currentURL = webView.request.URL.absoluteString;
	[urlField setText:currentURL];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	NSLog(@"Web Page failed to load");
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString* urlAddress = @"http://www.google.com";
	
	NSURL* url = [NSURL URLWithString:urlAddress];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	[webView loadRequest:request];
	[urlField setText:urlAddress];
}


- (BOOL)respondsToSelector:(SEL)aSelector
{
	NSLog(@"SELECTOR: %@ sent to class %@",NSStringFromSelector(aSelector),[self class]);
	return [super respondsToSelector:aSelector];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
	[urlField release];
	[webView release];
	[activityIndicator release];
}

@end
