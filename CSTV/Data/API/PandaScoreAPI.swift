//
//  PandaScoreAPI.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation
import Moya

enum GithubAPI {
    case searchRepositories(query: String)
}

extension GithubAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api.github.com")!
    }

    var path: String {
        switch self {
        case .searchRepositories:
            return "search/repositories"
        }
    }

    var method: Moya.Method {
        switch self {
        case .searchRepositories:
            return .get
        }
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        var parameters = [String: Any]()

        switch self {
        case .searchRepositories(let query):
            parameters["q"] = query
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}
