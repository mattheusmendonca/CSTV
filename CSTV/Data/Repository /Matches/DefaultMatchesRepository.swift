//
//  DefaultMatchesRepository.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

class DefaultMatchesRepository: MatchesRepository {
    private let dataSource: MatchesDataSource
    private let selectedMatches: [Matches] = []
    private let page: Int = 0
    private let totalPages: Int = 10
   
    let matches: Observable<[Matches]> = .init([])
    let state: Observable<MatchesRepository> = .init(.idle)
    
    init(dataSource: MatchesDataSource = RemoteMatchesDataSource()) {
        self.dataSource = dataSource
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
        
    }
    
    func refresh() {
        self.page = 0
        self.getNextMatches()
        self.getMatchesHappening()
        self.selectedMatches.removeAll()
        self.matches.value.removeAll()
    }
}
