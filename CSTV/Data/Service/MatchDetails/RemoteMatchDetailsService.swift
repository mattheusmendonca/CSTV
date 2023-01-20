//
//  RemoteMatchesDetailsService.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation
import Moya

struct MatchDetailsErrorMessage: Codable, Error {
    let message: String
}

class RemoteMatchDetailsService: MatchDetailsService {
    func getAllTeams(page: Int, completion: @escaping (Result<[MatchDetailsResponse], MatchDetailsErrorMessage>) -> Void) {
        
        self.provider.request(.getAllTeams(page: page)) { result in
            switch result {
            case .success(let response):
                completion(success(response))
            case .failure(let error):
                completion(.failure(MatchesErrorMessage(message: error.localizedDescription)))
            }
        }
    }
}
