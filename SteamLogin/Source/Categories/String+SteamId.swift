//
//  File.swift
//  SteamKit
//
//  Created by Serhii Londar on 12/15/17.
//  Copyright © 2017 slon. All rights reserved.
//

import Foundation

private var STEAM_VANITY_ID_DECODE_URL = "https://api.steampowered.com/ISteamUser/ResolveVanityURL/v0001/?key=\(SteamLogin.steamApiKey)&vanityurl="

private let STEAMID64_IDENTIFIER: Int64 = 76561197960265728

extension String {
    static func convertSteamID(toSteamID64 steamID: String) -> String {
        var steamID64: String? = nil
        let components = steamID.components(separatedBy: ":")
        let z = Int64((Int(components[2]) ?? 0))
        let y = Int64((Int(components[1]) ?? 0))
        let v: Int64 = STEAMID64_IDENTIFIER
        steamID64 = "\(Int(z * 2 + v + y))"
        return steamID64 ?? ""
    }
    static func convertSteamID(toSteamID32 steamID: String) -> String {
        var steamID32: String? = nil
        let components = steamID.components(separatedBy: ":")
        let z = Int(components[2]) ?? 0
        let y = Int(components[1]) ?? 0
        steamID32 = "\(Int(z * 2 + y))"
        return steamID32 ?? ""
    }
    static func convertSteamID64(toSteamID steamID64: String) -> String {
        var steamID = "STEAM_0"
        let w = Int64(steamID64) ?? 0
        let v: Int64 = STEAMID64_IDENTIFIER
        let y = Int64(w % 2)
        var sid: Int64 = w - y - v
        sid = Int64((sid / 2))
        steamID += ":"
        steamID += "\(Int(y))"
        steamID += ":"
        steamID += "\(Int(sid))"
        return steamID
    }
    
    static func convertSteamID64(toSteamID32 steamID64: String) -> String {
        var steamID: String
        let w = Int64(steamID64) ?? 0
        let v: Int64 = STEAMID64_IDENTIFIER
        let sid: Int64 = w - v
        steamID = "\(Int(sid))"
        return steamID
    }
    
    static func convertVanityID(toSteamID64 vanityID: String) -> String? {
        var steamID64: String? = nil
        let vanityAddress: String = STEAM_VANITY_ID_DECODE_URL + vanityID
        let vanityURL = URL(string: vanityAddress)
        
        if let data = try? Data(contentsOf: vanityURL!) {
            if let steamVanity = try? JSONDecoder().decode(SteamVanity.self, from: data) {
                if steamVanity.response?.success! == 1 {
                    steamID64 = steamVanity.response?.steamid!
                }
            }
        }
        return steamID64
    }
}
