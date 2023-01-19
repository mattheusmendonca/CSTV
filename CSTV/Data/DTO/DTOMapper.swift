//
//  DTOMapper.swift
//  CSTV
//
//  Created by Mac Lavid on 18/01/23.
//

import Foundation

protocol DTOMapper {
    associatedtype DataModel
    associatedtype DomainModel
    
    static func map(_ dto: DataModel) -> DomainModel
}
