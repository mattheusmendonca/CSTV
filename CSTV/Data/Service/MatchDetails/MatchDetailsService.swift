//
//  MatchesDetailsService.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

struct MatchDetailsErrorMessage: Codable, Error {
    let message: String
}

protocol MatchDetailsService {
    func getAllTeams(page: Int, completion: @escaping (_ result: Result<[MatchTeamsDetailsResponse], MatchDetailsErrorMessage>) -> Void)
}
