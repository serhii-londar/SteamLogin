//
//	SteamVanityResponse.swift
//
//	Create by Serhii Londar on 15/12/2017
//	Copyright © 2017 Techmagic. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct SteamVanity : Codable {
	let response : SteamVanityResponse?
    
	enum CodingKeys: String, CodingKey {
		case response
	}
	
    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(SteamVanityResponse.self, forKey: .response)
	}
}
