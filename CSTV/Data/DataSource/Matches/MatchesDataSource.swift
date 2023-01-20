//
//  MatchesDataSource.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

protocol MatchesDataSource {
    func getNextMatches(page: Int, completion: @escaping (_ result: Result<[Matches], MatchesErrorMessage>) -> Void)
    func getMatchesHappening(completion: @escaping (_ result: Result<[Matches], MatchesErrorMessage>) -> Void)
}
