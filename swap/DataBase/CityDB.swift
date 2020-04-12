//
//  CityDB.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

class CityDB {
    
    private var cityList: [City] = []
    
    static let shared = CityDB()
    private init() {
        let city1 = City(name: "Анапа", id: "1")
        let city2 = City(name: "Воронеж", id: "2")
        let city3 = City(name: "Геленджик", id: "3")
        let city4 = City(name: "Грозный", id: "4")
        let city5 = City(name: "Амурск", id: "5")
        let city6 = City(name: "Балашиха", id: "6")
        let city7 = City(name: "Барнаул", id: "7")
        let city8 = City(name: "Благовещенск", id: "8")
        let city9 = City(name: "Владивосток", id: "9")
        let city10 = City(name: "Владимир", id: "10")
        let city11 = City(name: "Владивосток", id: "11")
        let city12 = City(name: "Гвардейск", id: "12")
        
        
        cityList = [city1,city5, city6, city7, city8, city9,city2,city3, city10,city11,city12,city4]
    }
    
    func getCityList() -> [City] {
        return cityList
    }
    
}
