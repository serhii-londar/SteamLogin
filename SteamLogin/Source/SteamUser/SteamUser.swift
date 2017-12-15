//
//  SteamUser.swift
//  SteamKit
//
//  Created by Serhii Londar on 12/15/17.
//  Copyright © 2017 slon. All rights reserved.
//

import Foundation

public class SteamUser {
    public var steamID64: String?
    public var steamID32: String?
    public var steamVanityID: String?
    
    public init(steamID32: String) {
        self.steamID32 = steamID32
    }
    
    public init(steamID64: String) {
        self.steamID64 = steamID64
        steamID32 = String.convertSteamID64(toSteamID32: steamID64)
    }
    
    public init(steamVanityID: String) {
        self.steamVanityID = steamVanityID
        steamID64 = String.convertVanityID(toSteamID64: steamVanityID)
        steamID32 = String.convertSteamID64(toSteamID32: steamID64!)
    }
}
