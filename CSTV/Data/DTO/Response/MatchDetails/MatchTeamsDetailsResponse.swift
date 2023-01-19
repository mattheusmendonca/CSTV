//
//  MatchTeamsDetailsResponse.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

struct MatchTeamsDetailsResponse: Codable {
    let id: Int
    let name: String
    let imageUrl: String?
    let players: [MatchDetailsResponse]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, players
        case imageUrl = "image_url"
    }
}

struct MatchTeamsDetailsResponseMapper: Codable {
    static func map(_ dto: MatchTeamsDetailsResponse) -> TeamsDetails {
        
        var url: URL? = nil
        var players: [Players] = []
        
        if let urlString = dto.imageUrl {
            url = URL(string: urlString)
        }
        
        for player in dto.players {
            players.append(MatchDetailsResponseMapper.map(player))
        }
                           
        return TeamsDetails(id: dto.id, name: dto.name, players: players, imageUrl: url)
    }
}
