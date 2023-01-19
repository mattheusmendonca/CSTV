//
//  Players.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct Players: Codable {
    let nickname: String
    let firstName: String?
    let lastName: String?
    let imageUrl: URL?
}
