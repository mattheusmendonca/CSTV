//
//  AuthManager.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation
import Moya

class AccessTokenPluginManager {
    static let shared = AccessTokenPluginManager()

    let authPlugin = AccessTokenPlugin { _ in
        AuthManager.shared.userRepository.currentUser.value?.token.components(separatedBy: " ")[1] ?? ""
    }
}

final class AuthManager {
    
    static let shared = AuthManager()
    //let userRepository: UserRepository = DefaultUserRepository()
    //let formRepository: FormRepository = DefaultFormRepository()
    
    private init() {}
}
