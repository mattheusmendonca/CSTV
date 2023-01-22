//
//  MatchDetailsResponse.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

struct MatchDetailsResponse: Codable {
    let nicknamePlayer: String
    let firstNamePlayer: String?
    let lastNamePlayer: String?
    let imageUrlPlayer: String?
    
    private enum CodingKeys: String, CodingKey {
        case nicknamePlayer = "name"
        case firstNamePlayer = "first_name"
        case lastNamePlayer = "last_name"
        case imageUrlPlayer = "image_url"
    }
}

struct MatchDetailsResponseMapper: DTOMapper {
    static func map(_ dto: MatchDetailsResponse) -> Players {
        
        var url: URL? = nil
        
        if let urlString = dto.imageUrlPlayer {
            url = URL(string: urlString)
        }
        
        return Players(firstName: dto.firstNamePlayer, lastName: dto.lastNamePlayer, nickname: dto.nicknamePlayer, imageUrl: url)
    }
}
