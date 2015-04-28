//
//  DetailViewController.h
//  HandsOffDemo
//
//  Created by iandai on 4/28/15.
//  Copyright (c) 2015 iandai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@end

