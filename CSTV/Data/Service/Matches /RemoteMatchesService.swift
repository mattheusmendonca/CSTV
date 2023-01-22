//
//  RemoteMatchesService.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation
import Moya

class RemoteMatchesService: MatchesService {
    
    private let provider = MoyaProvider<PandaScoreAPI>(plugins: [AccessTokenPluginManager.shared.authPlugin])
    
    func getMatchesHappening(completion: @escaping (Result<[MatchesResponse], MatchesErrorMessage>) -> Void) {
        self.provider.request(.getMatchesHappening) { result in
            switch result {
            case .success(let response):
                do {
                    let matchesHappening = try response.map([MatchesResponse].self)
                    completion(.success(matchesHappening))
                } catch {
                    let errorResponse = try? response.map(MatchesErrorMessage.self)
                    completion(.failure(errorResponse ?? MatchesErrorMessage(message: error.localizedDescription)))
                }
            case .failure(let error):
                completion(.failure(MatchesErrorMessage(message: error.localizedDescription)))
            }
        }
    }
    
    func getNextMatches(page: Int, completion: @escaping (Result<[MatchesResponse], MatchesErrorMessage>) -> Void) {
        self.provider.request(.getNextMatches(page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    let nextMatches = try response.map([MatchesResponse].self)
                    completion(.success(nextMatches))
                } catch {
                    let errorResponse = try? response.map(MatchesErrorMessage.self)
                    completion(.failure(errorResponse ?? MatchesErrorMessage(message: error.localizedDescription)))
                }
            case .failure(let error):
                completion(.failure(MatchesErrorMessage(message: error.localizedDescription)))
            }
        }
    }
}
