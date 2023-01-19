//
//  TeamsDetails.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct TeamsDetails: Codable {
    let id: Int
    let name: String
    let players: [Players]
    let imageUrl: URL?
}
