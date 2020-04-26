//
//  User.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

struct User: Encodable {
    var email: String
    var uid: String
    var name: String
    var city: City?
    
    init(email: String, uid: String, name: String, city: City? = nil) {
        self.email = email
        self.uid = uid
        self.name = name
        self.city = city
    }
    
    init(dictionary: [String:Any]) throws {
        let emailKey = CodingKeys.email.stringValue
        let uidKey = CodingKeys.uid.stringValue
        let nameKey = CodingKeys.name.stringValue
        
        guard let email = dictionary[emailKey] as? String,
            let uid = dictionary[uidKey] as? String,
            let name = dictionary[nameKey] as? String else {
                throw SystemError.custom("Faild to create User instance using dictionary")
        }
        
        self.city = City(dictionary: dictionary)
        
        self.email = email
        self.uid = uid
        self.name = name
    }
    
    enum CodingKeys: CodingKey {
        case email
        case uid
        case name
        case city
    }
}
