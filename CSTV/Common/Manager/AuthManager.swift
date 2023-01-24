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
        "RsIcE8L8pkF12Zl_W6kymOmu2Ye4Q_ToqiXtOVIic7dxqr6jRJ0"
    }
}


