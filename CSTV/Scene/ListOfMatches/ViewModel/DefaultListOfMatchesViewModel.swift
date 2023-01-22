//
//  DefaultListOfMatchesViewModel.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation

class DefaultListOfMatchesViewModel: ListOfMatchesViewModel {
    private let matchesRepository: MatchesRepository
    let listMatches: Observable<[Matches]> = .init([])
    let finishLoading: Observable<Bool> = .init(false)
    
    weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator, matchesRepository: MatchesRepository = DefaultMatchesRepository()) {
        self.coordinator = coordinator
        self.matchesRepository = matchesRepository
        self.bind(to: matchesRepository)
        self.getListOfMatches()
    }
    
    private func didLoadMatches(state: MatchesRepositoryState) {
        self.finishLoading.value = state == .loaded
    }
    
    private func bind(to matchesRepository: MatchesRepository) {
        matchesRepository.matches.addAndNotify(observer: self) { [weak self] matches in
            self?.listMatches.value = matches
        }
        matchesRepository.state.addAndNotify(observer: self) { [weak self] state in
            self?.didLoadMatches(state: state)
        }
    }
    
    func getListOfMatches() {
        self.matchesRepository.getMatchesHappening()
        self.matchesRepository.getNextMatches()
    }
    
    func refreshListOfMatches() {
        self.matchesRepository.refresh()
    }
    
    func pagination(indexPath: IndexPath) {
        if indexPath.row == self.listMatches.value.count - 1 {
            self.matchesRepository.getMatchesHappening()
        }
    }
    
    func goToMatchesDetails(match: Matches) {
        self.coordinator?.goToMatchesDetails(match: match)
    }
    
}
