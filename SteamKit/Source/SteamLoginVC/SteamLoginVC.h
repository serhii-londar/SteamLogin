//
//  SteamLoginVC.h
//  SteamKit
//
//  Created by Serhii Londar on 7/5/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SteamUser.h"
#import "SteamUser+Local.h"

typedef void (^SteamLoginVCHandler)(SteamUser *user, NSError *error);

@interface SteamLoginVC : UIViewController

+ (void)loginOnViewController:(UIViewController *)viewController completionBlock:(SteamLoginVCHandler)completionBlock;

@end
