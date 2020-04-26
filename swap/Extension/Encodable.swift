//
//  Encodable.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

extension Encodable {
    
    func toJsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .secondsSince1970
        return try encoder.encode(self)
    }
    
    func toDictionary() throws -> [String: Any] {
        let data = try self.toJsonData()
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dict = json as? [String : Any] else {
            throw SystemError.custom("Cast to dictionary failed")
        }
        return dict
    }
    
}
