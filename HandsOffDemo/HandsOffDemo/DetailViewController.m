//
//  DetailViewController.m
//  HandsOffDemo
//
//  Created by iandai on 4/28/15.
//  Copyright (c) 2015 iandai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIWebViewDelegate>
@property NSUserActivity *myActivity;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webview.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"http://www.uniqlo.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webview loadRequest:request];

    self.indicator.hidden = NO;
    [self.indicator startAnimating];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

    [self.indicator startAnimating];
    self.indicator.hidden = YES;
    
    self.myActivity = [[NSUserActivity alloc] initWithActivityType: @"com.uniqlo.home"];
    self.myActivity.webpageURL = [NSURL URLWithString:@"http://www.uniqlo.com"];
    [self.myActivity becomeCurrent];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
