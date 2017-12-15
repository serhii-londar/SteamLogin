//
//  SteamUser+Local.swift
//  SteamKit
//
//  Created by Serhii Londar on 12/15/17.
//  Copyright © 2017 slon. All rights reserved.
//

import Foundation

//extension SteamUser: NSCoding {
//    static func loadUser() -> SteamUser? {
//        let defaults: UserDefaults? = UserDefaults.standard
//        let encodedObject = defaults?.object(forKey: "SteamUser") as? Data
//        let object = NSKeyedUnarchiver.unarchiveObject(with: encodedObject ?? Data()) as? SteamUser
//        return object
//    }
//
//    func save() {
//        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: self)
//        let defaults: UserDefaults? = UserDefaults.standard
//        defaults?.set(encodedObject, forKey: "SteamUser")
//        defaults?.synchronize()
//    }
//
//    func encode(with encoder: NSCoder) {
//        encoder.encode(steamID64, forKey: "steamID64")
//        encoder.encode(steamID32, forKey: "steamID32")
//        encoder.encode(steamVanityID, forKey: "steamVanityID")
//    }
//
//    convenience init?(coder aDecoder: NSCoder) {
//        super.init(aDecoder)
//        steamID64 = aDecoder.decodeObject(forKey: "steamID64") as? String
//        steamID32 = aDecoder.decodeObject(forKey: "steamID32") as? String
//        steamVanityID = aDecoder.decodeObject(forKey: "steamVanityID") as? String
//    }
//}

