//
//  Matches.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct Matches: Codable {
    let adversary: [Adversary]
    let league: League
    let date: Date?
    let status: String
}
