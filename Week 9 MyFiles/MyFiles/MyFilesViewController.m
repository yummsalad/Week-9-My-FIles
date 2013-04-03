//
//  MyFilesViewController.m
//  MyFiles
//
//  Created by Charles Konkol on 3/25/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MyFilesViewController.h"

@interface MyFilesViewController ()

@end

@implementation MyFilesViewController
@synthesize WebView=WebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [WebView release];
    [super dealloc];
}
- (IBAction)btnLocal:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"angrybirds" ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    UIWebView *webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [[webView scrollView] setContentOffset:CGPointMake(0,500) animated:YES];
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.scrollTo(0.0, 50.0)"]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    [webView release];
   }

- (IBAction)btnWeb:(id)sender {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    NSURL *targetURL = [NSURL URLWithString:@"https://www.dropbox.com/s/f7ouvj3dd131e0c/RVC%20to%20Offer%20App%20Development%20Course.pdf"];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    [webView release];

}
@end
