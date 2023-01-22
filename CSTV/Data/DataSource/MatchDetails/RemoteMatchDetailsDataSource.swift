//
//  RemoteMatchDetailsDataSource.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

class RemoteMatchDetailsDataSource: MatchDetailsDataSource {
    private let service: MatchDetailsService
    
    init(service: MatchDetailsService = RemoteMatchDetailsService()) {
        self.service = service
    }
    
    func getAllTeams(page: Int, completion: @escaping (Result<[TeamsDetails], MatchDetailsErrorMessage>) -> Void) {
        self.service.getAllTeams(page: page) { result in
            switch result {
            case .success(let teamsResponse):
                let teamsMapped = teamsResponse.map {
                    MatchTeamsDetailsResponseMapper.map($0)
                }
                completion(.success(teamsMapped))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
