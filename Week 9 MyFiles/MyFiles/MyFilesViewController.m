//
//  MyFilesViewController.m
//  MyFiles
//
//  Created by Charles Konkol on 3/25/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//  Updated October 2013 

#import "MyFilesViewController.h"

@interface MyFilesViewController ()

@end

@implementation MyFilesViewController
@synthesize WebView;

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
    [self loadlocalFile];
}
- (IBAction)btnWeb:(id)sender {
    [self loadexternalFile];
    
}
- (void)loadlocalFile
{
    //check if iphone or ipad
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //load file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"angrybirds" ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        
        //get screensize
         CGSize size = [self getScreenSize];
        
        //set screensize
        UIWebView *webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 50, size.width, size.height-100)];
        [[webView scrollView] setContentOffset:CGPointMake(0,size.height) animated:YES];
        
        //scroll 0 left pixel, 50 top pixel
        [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.scrollTo(0.0, 50.0)"]];
        [webView loadRequest:request];
        
        //load file into webview
        [self.view addSubview:webView];
        [webView release];

        
    }
    
    else {
        //load file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"angrybirds" ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        
        //set screensize
         CGSize size = [self getScreenSize];
        UIWebView *webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 50, size.width, size.height-100)];
        [[webView scrollView] setContentOffset:CGPointMake(0,size.height) animated:YES];
        
       //scroll 0 left pixel, 50 top pixel
        [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.scrollTo(0.0, 50.0)"]];
        [webView loadRequest:request];
        
           //load file into webview
        [self.view addSubview:webView];
        [webView release];

        
    }

   
}

- (void)loadexternalFile
{
    //check if connect to internet before external URL
    if([self checkinternet] == NO)
    {
        // Not connected to the internet
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Internet Connection Required"
                                                          message:@"Close app and return when internet connection available."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        //check if iphone or ipad
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            //get screen size
            CGSize size = [self getScreenSize];
            
            //set size
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, size.width, size.height-100)];
            
            NSURL *targetURL = [NSURL URLWithString:@"http://ckonkol.com/wp-content/uploads/2013/10/spring2014.pdf"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            [webView loadRequest:request];
            
            //load file in to webview
            [self.view addSubview:webView];
            [webView release];
            
        }
        
        else {
               //get screen size
              CGSize size = [self getScreenSize];
            
              //set size
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, size.width, size.height-100)];
            
            NSURL *targetURL = [NSURL URLWithString:@"http://ckonkol.com/wp-content/uploads/2013/10/spring2014.pdf"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            [webView loadRequest:request];
            
              //load file in to webview
            [self.view addSubview:webView];
            [webView release];
            
        }

        
    }
   
   

}
- (CGSize)getScreenSize
{
    //Get Screen size
    CGSize size;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
        // in Landscape mode, width always higher than height
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height < [[UIScreen mainScreen] bounds].size.width) {
        // in Portrait mode, height always higher than width
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else {
        // otherwise it is normal
        size.height = [[UIScreen mainScreen] bounds].size.height;
        size.width = [[UIScreen mainScreen] bounds].size.width;
    }
    return size;
}
- (BOOL) checkinternet
{
    //check internet connection
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }
    else
    {
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
    
}

@end
