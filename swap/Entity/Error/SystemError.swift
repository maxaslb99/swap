//
//  SystemError.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

enum SystemError: LocalizedError {
    
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .custom(let value):
            return value
        }
    }
    
}
