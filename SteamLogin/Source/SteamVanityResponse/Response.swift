//
//	Response.swift
//
//	Create by Serhii Londar on 15/12/2017
//	Copyright © 2017 Techmagic. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct SteamVanityResponse : Codable {
	let steamid : String?
	let success : Int?

	enum CodingKeys: String, CodingKey {
		case steamid = "steamid"
		case success = "success"
	}
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		steamid = try values.decodeIfPresent(String.self, forKey: .steamid)
		success = try values.decodeIfPresent(Int.self, forKey: .success)
	}
}
