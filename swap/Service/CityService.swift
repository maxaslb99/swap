//
//  CityService.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

class CityService {
    
    static var shared = CityService()
    private init() {}
    
    var selectedCity: City?
    
}
