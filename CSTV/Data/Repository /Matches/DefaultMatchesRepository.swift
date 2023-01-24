//
//  DefaultMatchesRepository.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

class DefaultMatchesRepository: MatchesRepository {
    private let dataSource: MatchesDataSource
    private var selectedMatches: [Matches] = []
    private var page: Int = 0
    private let totalPages: Int = 20
   
    let matches: Observable<[Matches]> = .init([])
    let state: Observable<MatchesRepositoryState> = .init(.idle)
    
    init(dataSource: MatchesDataSource = RemoteMatchesDataSource()) {
        self.dataSource = dataSource
    }
    
    func refresh() {
        self.page = 0
        self.getNextMatches()
        self.getMatchesHappening()
        self.selectedMatches.removeAll()
        self.matches.value.removeAll()
    }
    
    func getMatchesHappening() {
        self.dataSource.getMatchesHappening { [weak self] result in
            switch result {
            case .success(let matchesHappening):
                for match in matchesHappening {
                    if match.adversary.count == 2 {
                        self?.selectedMatches.append(match)
                    }
                }
            case .failure(let error):
                self?.state.value = .error(.generic(errorMessage: error.message))
            }
        }
    }
    
    func getNextMatches() {
        guard self.page < self.totalPages, self.state.value != .loading else { return }
        
        self.page += 1
        self.state.value = .loading
        
        self.dataSource.getNextMatches(page: self.page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let nextMatches):
                for match in nextMatches {
                    if match.adversary.count == 2 {
                        self.selectedMatches.append(match)
                    }
                }
                self.matches.value.append(contentsOf: self.selectedMatches)
                self.matches.value.sort{ $0.status > $1.status }
                self.selectedMatches.removeAll()
                self.state.value = .loaded
            case .failure(let error):
                self.state.value = .error(.generic(errorMessage: error.message))
                
            }
        }
    }
}
