//
//  SteamUser.swift
//  SteamKit
//
//  Created by Serhii Londar on 12/15/17.
//  Copyright © 2017 slon. All rights reserved.
//

import Foundation

public class SteamUser: NSObject, NSCoding {
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
    
    public func encode(with encoder: NSCoder) {
        encoder.encode(steamID64, forKey: "steamID64")
        encoder.encode(steamID32, forKey: "steamID32")
        encoder.encode(steamVanityID, forKey: "steamVanityID")
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        let steamID32 = aDecoder.decodeObject(forKey: "steamID32") as? String ?? ""
        self.init(steamID32: steamID32)
        self.steamID64 = aDecoder.decodeObject(forKey: "steamID64") as? String
        self.steamID32 = aDecoder.decodeObject(forKey: "steamID32") as? String
        self.steamVanityID = aDecoder.decodeObject(forKey: "steamVanityID") as? String
    }
}

extension SteamUser {
    public static func load() -> SteamUser? {
        let defaults = UserDefaults.standard
        guard let encodedObject = defaults.data(forKey: "SteamUser") else { return nil }
        let object = NSKeyedUnarchiver.unarchiveObject(with: encodedObject) as? SteamUser 
        return object
    }
    
    public func save() {
        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: self)
        let defaults = UserDefaults.standard
        defaults.set(encodedObject, forKey: "SteamUser")
        defaults.synchronize()
    }
}
