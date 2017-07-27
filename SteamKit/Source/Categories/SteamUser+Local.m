//
//  SteamUser+Local.m
//  SteamKit
//
//  Created by Serhii Londar on 10/24/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import "SteamUser+Local.h"
#import <RMMapper.h>

@implementation SteamUser (Local)

+ (SteamUser *)load {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"SteamUser"];
    SteamUser *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

- (void)save {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"SteamUser"];
    [defaults synchronize];
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.steamID64 forKey:@"steamID64"];
    [encoder encodeObject:self.steamID32 forKey:@"steamID32"];
    [encoder encodeObject:self.steamVanityID forKey:@"steamVanityID"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.steamID64 = [decoder decodeObjectForKey:@"steamID64"];
        self.steamID32 = [decoder decodeObjectForKey:@"steamID32"];
        self.steamVanityID = [decoder decodeObjectForKey:@"steamVanityID"];
    }
    return self;
}

@end
