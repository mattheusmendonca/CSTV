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
        "nwcYIRxJtCFh7KMSg3Le9zpFCb0oFgfZWpNXZ9Nz4HXKnAA2wCg"
    }
}


