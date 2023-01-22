//
//  RemoteMatchesDataSource.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

class RemoteMatchesDataSource: MatchesDataSource {
    private let service: MatchesService
    
    init(service: MatchesService = RemoteMatchesService()) {
        self.service = service
    }
    
    func getMatchesHappening(completion: @escaping (Result<[Matches], MatchesErrorMessage>) -> Void) {
        self.service.getMatchesHappening { result in
            switch result {
            case .success(let matchesResponse):
                let matchesMapped = matchesResponse.map {
                    MatchesResponseMapper.map($0)
                }
                completion(.success(matchesMapped))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getNextMatches(page: Int, completion: @escaping (Result<[Matches], MatchesErrorMessage>) -> Void) {
            self.service.getNextMatches(page: page) { result in
            switch result {
            case .success(let matchesResponse):
                let matchesMapped = matchesResponse.map {
                    MatchesResponseMapper.map($0)
                }
                completion(.success(matchesMapped))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
