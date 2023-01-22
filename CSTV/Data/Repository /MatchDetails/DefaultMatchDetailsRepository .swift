//
//  DefaultMatchDetailsRepository .swift
//  CSTV
//
//  Created by Mac Lavid on 20/01/23.
//

import Foundation

class DefaultMatchDetailsRepository: MatchDetailsRepository {
    private let dataSource: MatchDetailsDataSource
    private let totalPages: Int = 41
    
    let teams: Observable<[TeamsDetails]> = .init([])
    let state: Observable<MatchDetailsRepositoryState> = .init(.idle)
    
    init(dataSource: MatchDetailsDataSource = RemoteMatchDetailsDataSource()) {
        self.dataSource = dataSource
    }
    
    func getAllTeams(match: Matches) {
        self.state.value = .loading
        
        for page in 1...self.totalPages {
            self.dataSource.getAllTeams(page: page) { [weak self] result in
                switch result {
                case .success(let teams):
                    for team in teams {
                        if team.id == match.adversary[0].adversary.id || team.id == match.adversary[1].adversary.id {
                            self?.teams.value.append(team)
                            
                            if self?.teams.value.count == 2 {
                                self?.state.value = .loaded
                                return
                            }
                        }
                    }
                case .failure(let error):
                    self?.state.value = .error(.generic(errorMessage: error.message))
                }
            }
        }
    }
}
