//
//  AdversaryResponse.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct AdversaryResponse: Codable {
    let adversary: AdversarySpecificationsResponse
}

struct AdversaryResponseMapper: DTOMapper {
    static func map(_ dto: AdversaryResponse) -> Adversary {
        return Adversary(adversary: AdversarySpecificationsResponseMapper.map(dto.adversary))
    }
}
