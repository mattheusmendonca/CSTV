//
//  DefaultMatchDetailsViewModel.swift
//  CSTV
//
//  Created by Mac Lavid on 23/01/23.
//

import Foundation

class DefaultMatchDetailsViewModel: MatchDetailsViewModel {
    
    private let matchDetailsRepository: MatchDetailsRepository
    weak var coordinator: MainCoordinator?
    
    let teams: Observable<[TeamsDetails]?> = .init(nil)
    let match: Observable<Matches?> = .init(nil)
    let state: Observable<MatchDetailsRepositoryState> = .init(.idle)
    let finishLoading: Observable<Bool> = .init(false)
    
    init(coordinator: MainCoordinator, matchDetailsRepository: MatchDetailsRepository = DefaultMatchDetailsRepository(), match: Matches) {
        self.coordinator = coordinator
        self.matchDetailsRepository = matchDetailsRepository
        self.match.value = match
        self.bind(to: matchDetailsRepository)
        self.getTeams()
    }
    
    private func bind(to matchDetailsRepository: MatchDetailsRepository) {
        matchDetailsRepository.teams.addAndNotify(observer: self) { [weak self] teams in
            self?.teams.value = teams
        }
        matchDetailsRepository.state.addAndNotify(observer: self) { [weak self] state in
            self?.didLoadteams(state: state)
        }
    }
    
    private func didLoadteams(state: MatchDetailsRepositoryState) {
        self.finishLoading.value = state == .loaded
    }
    
    func getTeams() {
        guard let match = self.match.value else { return }
        self.matchDetailsRepository.getAllTeams(match: match)
    }
    
    func goBack() {
        self.coordinator?.goBackListOfMatches()
    }
}
