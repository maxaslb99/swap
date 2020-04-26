//
//  City.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

struct City: Encodable {
    var name: String
    var id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    init?(dictionary: [String:Any]) {
        
        let idKey = CodingKeys.id.rawValue
        let nameKey = CodingKeys.name.rawValue
        
        guard let id = dictionary[idKey] as? String,
            let name = dictionary[nameKey] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "cityId"
        case name = "cityName"
    }
}
