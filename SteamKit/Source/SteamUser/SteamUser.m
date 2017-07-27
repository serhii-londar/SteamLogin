//
//  SteamUser.m
//  SteamKit
//
//  Created by Serhii Londar on 7/5/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import "SteamUser.h"
#import "NSString+SteamId.h"

@implementation SteamUser

- (void)setSteamID32:(NSString *)steamID32 {
    _steamID32 = steamID32;
}

- (void)setSteamID64:(NSString *)steamID64 {
    _steamID64 = steamID64;
    _steamID32 = [NSString convertSteamID64ToSteamID32:steamID64];
}

- (void)setSteamVanityID:(NSString *)steamVanityID {
    _steamVanityID = steamVanityID;
    _steamID64 = [NSString convertVanityIDToSteamID64:steamVanityID];
    _steamID32 = [NSString convertSteamID64ToSteamID32:_steamID64];
}

@end
