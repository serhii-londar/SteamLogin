//
//  ViewController.m
//  SteamKitExample
//
//  Created by Serhii Londar on 7/28/17.
//  Copyright © 2017 slon. All rights reserved.
//

#import "ViewController.h"
#import <SteamKit/SteamUser.h>
#import <SteamKit/SteamLoginVC.h>

@interface ViewController () {
    SteamUser *_user;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    SteamUser *lUser = [SteamUser load];
    if (lUser) {
        
    } else {
        [SteamLoginVC loginOnViewController:self completionBlock:^(SteamUser *user, NSError *error) {
            if (error == nil) {
                _user = user;
                [_user save];
            } else {
                
            }
        }];
    }
}

@end
