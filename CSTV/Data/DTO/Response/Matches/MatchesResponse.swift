//
//  MatchesResponse.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct MatchesResponse: Codable {
    let adversary: [AdversaryResponse]
    let league: LeagueResponse
    let date: String?
    let status: String
    
    private enum CodingKeys: String, CodingKey {
        case league, status
        case date = "begin_at"
        case adversary = "opponents"
    }
}

struct MatchesResponseMapper: DTOMapper {
    static func map(_ dto: MatchesResponse) -> Matches {
        
        var adv: [Adversary] = []
        
        for adversary in dto.adversary {
            adv.append(AdversaryResponseMapper.map(adversary))
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ddd'T'HH:mm:ss.SSSXXX"
        let date = formatter.date(from: dto.date ?? "") ?? Date()
        
        return Matches(adversary: adv, league: LeagueResponseMapper.map(dto.league), date: date, status: dto.status)
    }
}
