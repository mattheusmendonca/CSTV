//
//  MatchesDetailsService.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

protocol MatchDetailsService {
    func getAllTeams(page: Int, completion: @escaping (_ result: Result<[MatchTeamsDetailsResponse], MatchDetailsErrorMessage>) -> Void)
}
