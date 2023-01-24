//
//  RemoteMatchesDetailsService.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation
import Moya

class RemoteMatchDetailsService: MatchDetailsService {
    
    private let provider = MoyaProvider<PandaScoreAPI>(plugins: [AccessTokenPluginManager.shared.authPlugin])
    
    func getAllTeams(page: Int, completion: @escaping (Result<[MatchTeamsDetailsResponse], MatchDetailsErrorMessage>) -> Void) {
        self.provider.request(.getAllTeams(page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    let allTeams = try response.map([MatchTeamsDetailsResponse].self)
                    completion(.success(allTeams))
                } catch {
                    let errorResponse = try? response.map(MatchDetailsErrorMessage.self)
                    completion(.failure(errorResponse ?? MatchDetailsErrorMessage(message: error.localizedDescription)))
                }
            case .failure(let error):
                completion(.failure(MatchDetailsErrorMessage(message: error.localizedDescription)))
            }
        }
    }
}
