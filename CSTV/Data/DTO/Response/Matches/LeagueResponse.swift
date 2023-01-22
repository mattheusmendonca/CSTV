//
//  LeagueResponse.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct LeagueResponse: Codable {
    let name: String
    let imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "image_url"
    }
}

struct LeagueResponseMapper: DTOMapper {
    static func map(_ dto: LeagueResponse) -> League {
        var url: URL? = nil
        
        if let urlString = dto.imageUrl {
            url = URL(string: urlString)
        }
        
        return League(name: dto.name, imageUrl: url)
    }
}
