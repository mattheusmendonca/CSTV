//
//  KeychainManager.swift
//  CSTV
//
//  Created by Mac Lavid on 19/01/23.
//

import Foundation
import KeychainSwift 

class KeyChainManager {
    private static let keychain = KeychainSwift()
    private static let encoder = JSONEncoder()
    private static let decoder = JSONDecoder()
    
    static func set<T: Codable>(_ value: T, forKey: String) -> Bool {
        guard let data = try? self.encoder.encode(value) else {
            return false
        }
        
        self.keychain.set(data, forKey: forKey)
        return true
    }
    
    static func get<T: Codable>(_ key: String) -> T? {
        guard let data = self.keychain.getData(key) else {
            return nil
        }
        
        return try? self.decoder.decode(T.self, from: data)
    }
}
