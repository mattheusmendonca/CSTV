//
//  PandaScoreAPI.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation
import Moya

enum PandaScoreAPI {
    case getNextMatches(page: Int)
    case getMatchesHappening
    case getAllTeams(page: Int)
}

extension PandaScoreAPI: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .getNextMatches, .getMatchesHappening, .getAllTeams:
            return .bearer
        }
    }
    
    var baseURL: URL {
        URL(string: "https://api.pandascore.co")!
    }

    var path: String {
        switch self {
        case .getNextMatches:
            return "/csgo/matches/upcoming"
            
        case .getMatchesHappening:
            return "/csgo/matches/running"
            
        case .getAllTeams:
            return "/csgo/teams"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getNextMatches, .getMatchesHappening, .getAllTeams:
            return .get
        }
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .getNextMatches(let page):
            return .requestParameters(parameters: ["page" : page], encoding: JSONEncoding.default)
            
        case .getMatchesHappening:
            return .requestPlain
            
        case .getAllTeams(let page):
            return .requestParameters(parameters: ["page" : page], encoding: JSONEncoding.default)
        }
    }

    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}
