//
//  MatchDetailsViewModel.swift
//  CSTV
//
//  Created by Mac Lavid on 23/01/23.
//

import Foundation

protocol MatchDetailsViewModelInput {
    func goBack()
    func getTeams()
}

protocol MatchDetailsViewModelOutput {
    var teams: Observable<[TeamsDetails]?> { get }
    var match : Observable<Matches?> { get }
    var state: Observable<MatchDetailsRepositoryState> { get }
    var finishLoading: Observable<Bool> { get }
}

protocol MatchDetailsViewModel: MatchDetailsViewModelInput & MatchDetailsViewModelOutput {}
