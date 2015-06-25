//
//  ViewController.m
//  WebViewJsBridge
//
//  Created by iandai on 6/24/15.
//  Copyright (c) 2015 iandai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

//1. HTML page, have commands can be read
//2. append js back to html and  run it

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate =self;
    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"Example" ofType:@"html"];
    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [self.webView loadHTMLString:appHtml baseURL:baseURL];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if([request.mainDocumentURL.relativePath isEqualToString:@"/getInfo/name"])
    {
        NSString *info = [[UIDevice currentDevice] name];
        NSString *js = [NSString stringWithFormat:@"showInfo(\"name\",\"%@\")",info];
        [self.webView stringByEvaluatingJavaScriptFromString:js];
        return NO;
    }
    if([request.mainDocumentURL.relativePath isEqualToString:@"/getInfo/systemVersion"])
    {
        NSString *info = [[UIDevice currentDevice] systemVersion];
        NSString *js = [NSString stringWithFormat:@"showInfo(\"systemVersion\",\"%@\")",info];
        [self.webView stringByEvaluatingJavaScriptFromString:js];
        return NO;
    }
    return YES;
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
