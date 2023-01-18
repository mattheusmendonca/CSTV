//
//  DefaultListOfMatchesViewModel.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation

protocol ListOfMatchesViewModelInput {
    func getMatches()
    func refreshMatches()
    func pagination(indexPath: IndexPath)
    func goToDetails(match: Matches)
}

protocol ListOfMatchesViewModelOutput {
    var matches: Observable<[Matches]> { get }
    var finishLoading: Observable<Bool> { get }
}

protocol MatchesViewModel: ListOfMatchesViewModelInput & ListOfMatchesViewModelOutput {}
