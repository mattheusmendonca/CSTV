//
//  MatchDetailsRepository.swift
//  CSTV
//
//  Created by Mac Lavid on 20/01/23.
//

import Foundation

enum MatchDetailsRepositoryError: Error, Equatable {
    case generic(errorMessage: String)
}

typealias MatchDetailsRepositoryState = RepositoryState<MatchDetailsRepositoryError>

protocol MatchDetailsRepository {
    var teams: Observable<[TeamsDetails]> { get }
    var state: Observable<MatchDetailsRepositoryState> { get }
    
    func getAllTeams(match: Matches)
}
