//
//  ViewController.m
//  WKNavigationActionExample
//
//  Created by 越智 修司 on 2014/09/24.
//  Copyright (c) 2014年 ClipReader project. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) WKWebView *webView;

@end

@implementation ViewController
-(void)loadView
{
  [super loadView];

  self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
  [self.view insertSubview:self.webView atIndex:0];
  self.webView.navigationDelegate = self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  NSURLRequest* req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
                       
  [self.webView loadRequest:req];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
  Log1(navigationAction);
  if([navigationAction.request.URL.host isEqualToString:@"www.apple.com"]){
    decisionHandler(WKNavigationActionPolicyAllow);
  }else{
    decisionHandler(WKNavigationActionPolicyCancel);
  }
}

@end
