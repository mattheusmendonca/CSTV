//
//  RemoteMatchesService.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation
import Moya

struct MatchesErrorMessage: Codable, Error {
    let message: String
}

class RemoteMatchesService: MatchesService {
    private let provider = MoyaProvider<PandaScoreAPI>(plugins: [AccessTokenPluginManager.shared.authPlugin])
    
    func getMatchesHappening(completion: @escaping (Result<[MatchesResponse], MatchesErrorMessage>) -> Void) {
        
        self.provider.request(.getMatchesHappening) { result in
            switch result {
            case .success(let response):
                completion(success(response))
            case .failure(let error):
                completion(.failure(MatchesErrorMessage(message: error.localizedDescription)))
            }
        }
    }
    
    func getNextMatches(page: Int, completion: @escaping (Result<[MatchesResponse], MatchesErrorMessage>) -> Void) {
        
        self.provider.request(.getNextMatches(page: page)) { result in
            switch result {
            case .success(let response):
                completion(success(response))
            case .failure(let error):
                completion(.failure(MatchesErrorMessage(message: error.localizedDescription)))
            }
        }
    }
}
