//
//  SteamUser.h
//  SteamKit
//
//  Created by Serhii Londar on 7/5/16.
//  Copyright © 2016 SLON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SteamUser : NSObject

@property(nonatomic, strong) NSString *steamID64;
@property(nonatomic, strong) NSString *steamID32;
@property(nonatomic, strong) NSString *steamVanityID;


@end
