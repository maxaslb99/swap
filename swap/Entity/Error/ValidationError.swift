//
//  ValidationError.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

enum ValidationError: LocalizedError {
    case fillAllFields
    
    var errorDescription: String? {
        switch self {
        case .fillAllFields:
            return "Заполните все поля!"
        }
    }
}
