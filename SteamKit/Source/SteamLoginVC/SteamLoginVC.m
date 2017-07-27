//
//  SteamLoginVC.m
//  SteamKit
//
//  Created by Serhii Londar on 7/5/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import "SteamLoginVC.h"

static NSString * const STEAM_MOBILE_LOGIN_URL = @"https://steamcommunity.com/mobilelogin";

@interface SteamLoginVC ()<UIWebViewDelegate> {
    IBOutlet UIWebView *_loginWebView;
    SteamLoginVCHandler _loginHandler;
}

@end

@implementation SteamLoginVC

- (instancetype)initWithLoginHandler:(SteamLoginVCHandler)loginHandler {
    self = [super initWithNibName:@"SteamLoginVC" bundle:[NSBundle bundleForClass:SteamLoginVC.class]];
    if (self) {
        _loginHandler = loginHandler;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *lCancel = [[UIButton alloc] init];
    [lCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [lCancel sizeToFit];
    [lCancel addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:lCancel]];
    _loginWebView.delegate = self;
    [_loginWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:STEAM_MOBILE_LOGIN_URL]]];
}


+ (void)loginOnViewController:(UIViewController *)viewController completionBlock:(SteamLoginVCHandler)completionBlock {
    SteamLoginVC *lLoginVC = [[SteamLoginVC alloc] initWithLoginHandler:completionBlock];
    UINavigationController *lNavigationVC = [[UINavigationController alloc] initWithRootViewController:lLoginVC];
    [viewController presentViewController:lNavigationVC animated:YES completion:nil];
}

#pragma mark WebViewDelegate
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.absoluteString rangeOfString:@"steamcommunity.com/profiles/"].location != NSNotFound) {
        NSArray *urlComponents = [request.URL.absoluteString componentsSeparatedByString:@"/"];
        NSString *potentialID = urlComponents[4];
        SteamUser *lUser = [SteamUser new];
        lUser.steamID64 = potentialID;
        _loginHandler(lUser, nil);
        [self dismissViewControllerAnimated:YES completion:nil];
        return NO;
    } else if ([request.URL.absoluteString rangeOfString:@"steamcommunity.com/id/"].location != NSNotFound) {
        NSArray *urlComponents = [request.URL.absoluteString componentsSeparatedByString:@"/"];
        NSString *potentialVanityID = urlComponents[4];
        SteamUser *lUser = [SteamUser new];
        lUser.steamVanityID = potentialVanityID;
        _loginHandler(lUser, nil);
        [self dismissViewControllerAnimated:YES completion:nil];
        return NO;
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

#pragma mark bar item
- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
