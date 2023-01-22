//
//  RepositoryState.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation

enum RepositoryState<ErrorType: Equatable>: Equatable {
    case idle
    case loading
    case loaded
    case error(_ error: ErrorType)
    case deleted
    case updated
}
