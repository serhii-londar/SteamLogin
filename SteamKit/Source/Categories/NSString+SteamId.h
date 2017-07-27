//
//  NSString+SteamId.h
//  SteamKit
//
//  Created by Serhii Londar on 7/5/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SteamId)

// Steam ID => Steam Community ID
// STEAM_0:1:65633249 => 76561198091532227
+ (NSString *)convertSteamIDToSteamID64:(NSString *)steamID;

// Steam Community ID => Steam ID
// 76561198091532227 => STEAM_0:1:65633249
+ (NSString *)convertSteamID64ToSteamID:(NSString *)steamID64;

// Steam ID => Steam Community ID
// STEAM_0:1:65633249 => 131266499
+ (NSString *)convertSteamIDToSteamID32:(NSString *)steamID;

// Steam Community ID => Steam ID
// 76561198091532227 => 131266499
+ (NSString *)convertSteamID64ToSteamID32:(NSString *)steamID64;

+ (NSString *)convertVanityIDToSteamID64:(NSString *)vanityID;

@end
