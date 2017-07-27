//
//  NSString+SteamId.m
//  SteamKit
//
//  Created by Serhii Londar on 7/5/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import "NSString+SteamId.h"

static NSString * const STEAM_VANITY_ID_DECODE_URL = @"http://api.steampowered.com/ISteamUser/ResolveVanityURL/v0001/?key=160A1E87653E30D9562DE9E5A47386E5&vanityurl=";
static long long const STEAMID64_IDENTIFIER = 76561197960265728;

@implementation NSString (SteamId)

+ (NSString *)convertSteamIDToSteamID64:(NSString *)steamID {
    
    NSString *steamID64 = nil;
    
    NSArray *components = [steamID componentsSeparatedByString:@":"];
    long long z = [components[2] intValue];
    long long y = [components[1] intValue];
    long long v = STEAMID64_IDENTIFIER;
    
    steamID64 = [NSString stringWithFormat:@"%ld", (long)(z * 2 + v + y)];
    
    return steamID64;
}


+ (NSString *)convertSteamIDToSteamID32:(NSString *)steamID {
    
    NSString *steamID32 = nil;
    
    NSArray *components = [steamID componentsSeparatedByString:@":"];
    NSInteger z = [components[2] intValue];
    NSInteger y = [components[1] intValue];
    
    steamID32 = [NSString stringWithFormat:@"%ld", (long)(z * 2 + y)];
    
    return steamID32;
}

+ (NSString *)convertSteamID64ToSteamID:(NSString *)steamID64  {
    
    NSMutableString *steamID = [@"STEAM_0" mutableCopy];
    
    long long w = [steamID64 longLongValue];
    long long v = STEAMID64_IDENTIFIER;
    long long y = w % (long)2;
    
    long long sid = w - y - v;
    sid = sid / 2;
    
    [steamID appendString:@":"];
    [steamID appendString:[NSString stringWithFormat:@"%ld", (long)y]];
    [steamID appendString:@":"];
    [steamID appendString:[NSString stringWithFormat:@"%ld", (long)sid]];
    
    return steamID;
}

+ (NSString *)convertSteamID64ToSteamID32:(NSString *)steamID64  {
    
    NSString *steamID;
    
    long long w = [steamID64 longLongValue];
    long long v = STEAMID64_IDENTIFIER;
    
    long long sid = w - v;
    
    steamID =[NSString stringWithFormat:@"%ld", (long)sid];
    
    return steamID;
}

+ (NSString *)convertVanityIDToSteamID64:(NSString *)vanityID {
    
    NSString *steamID64 = nil;
    
    // Gather vanity url
    NSMutableString *vanityAddress = [STEAM_VANITY_ID_DECODE_URL mutableCopy];
    [vanityAddress appendString:vanityID];
    NSURL *vanityURL = [NSURL URLWithString:vanityAddress];
    NSData *responseData = [NSData dataWithContentsOfURL:vanityURL];
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&error];
    if (error == nil && json) {
        if ([json[@"response"][@"success"] integerValue] == 1) {
            steamID64 = json[@"response"][@"steamid"];
        }
    }
    return steamID64;
}

@end
