//
//  ListOfMatchesViewModel.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation

protocol ListOfMatchesViewModelInput {
    func getListOfMatches()
    func refreshListOfMatches()
    func pagination(indexPath: IndexPath)
}

protocol ListOfMatchesViewModelOutput {
    var listMatches: Observable<[Matches]> { get }
    var finishLoading: Observable<Bool> { get }
}

protocol ListOfMatchesViewModel: ListOfMatchesViewModelInput & ListOfMatchesViewModelOutput {}
