//
//  UserService.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

class UserService {
    private var currentUser: User?
    
    static let shared = UserService()
    private init() {}
    
    func save(user: User) {
        currentUser = user
    }
    
    func removeUser() {
        currentUser = nil
    }
    
    func getUser() -> User? {
        return currentUser
    }
   
}
