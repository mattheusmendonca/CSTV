//
//  MatchDetailsDataSource.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

protocol MatchDetailsDataSource {
    func getAllTeams(page: Int, completion: @escaping (_ result: Result<[TeamsDetails], MatchDetailsErrorMessage>) -> Void)
}
