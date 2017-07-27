//
//  SteamUser+Local.h
//  SteamKit
//
//  Created by Serhii Londar on 10/24/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import "SteamUser.h"

@interface SteamUser (Local)

+ (SteamUser *)load;
- (void)save;

@end
