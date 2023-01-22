//
//  MatchesRepository.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

enum MatchesRepositoryError: Error, Equatable {
    case generic(errorMessage: String)
}

typealias MatchesRepositoryState = RepositoryState<MatchesRepositoryError>

protocol MatchesRepository {
    var state: Observable<MatchesRepositoryState> { get }
    var matches: Observable<[Matches]> { get }
    
    func refresh()
    func getNextMatches()
    func getMatchesHappening()
}
