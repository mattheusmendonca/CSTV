//
//  DefaultListOfMatchesViewModel.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation

class DefaultListOfMatchesViewModel: ListOfMatchesViewModel {
    
    weak var coordinator: MainCoordinator?
    
    private let matchesRepository: MatchesRepository
    let matches: Observable<[Matches]> = .init([])
    let finishLoading: Observable<Bool> = .init(false)
    
    
    
    init(coordinator: MainCoordinator, listOfMatchesRepository: MatchesRepository = DefaultListOfMatchesRepository()) {
        self.coordinator = coordinator
        self.matchesRepository = matchesRepository
        self.bind(to: matchesRepository)
        self.getMatches()
    }
    
    private func bind(to matchesRespository: MatchesRepository) {
        matchesRepository.matches.addAndNotify(observer: self) { [weak self] matches in
            self?.matches.value = matches
        }
        matchesRespository.state.addAndNotify(observer: self) { [weak self] state in
            self?.didLoadMatches(state: state)
        }
    }
    
    private func didLoadListOfMatches(state: MatchesRepositoryState) {
        self.finishLoading.value = state == .loaded
    }
    
    func getMatches() {
        self.matchesRepository.getRunningMatches()
        self.matchesRepository.getUpcomingMatches()
    }
    
    func refreshMatches() {
        self.matchesRepository.refresh()
    }
    
    func pagination(indexPath: IndexPath) {
        if indexPath.row == self.matches.value.count - 1 {
            self.matchesRepository.getUpcomingMatches()
        }
    }
    
    func goToDetails(match: Matches) {
        self.coordinator?.goToDetails(match: match)
    }
}
