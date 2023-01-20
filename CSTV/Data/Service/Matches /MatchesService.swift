//
//  MatchesService.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

protocol MatchesService {
    func getNextMatches(page: Int, completion: @escaping (_ result: Result<[MatchesResponse], MatchesErrorMessage>) -> Void)
    func getMatchesHappening(completion: @escaping (_ result: Result<[MatchesResponse], MatchesErrorMessage>) -> Void)
}
