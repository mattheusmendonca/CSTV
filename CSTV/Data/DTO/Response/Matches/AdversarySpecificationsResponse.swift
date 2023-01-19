//
//  AdversarySpecificationsResponse.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct AdversarySpecificationsResponse: Codable {
    let id: Int
    let name: String
    let imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case imageUrl = "image_url"
    }
}

struct AdversarySpecificationsResponseMapper: DTOMapper {
    static func map(_ dto: AdversarySpecificationsResponse) -> AdversarySpecifications {
        var url: URL? = nil
        
        if let urlString = dto.imageUrl {
            url = URL(string: urlString)
        }
        
        return AdversarySpecifications(id: dto.id, name: dto.name, imageUrl: url)
    }
}
