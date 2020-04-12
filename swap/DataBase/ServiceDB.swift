//
//  ServiceDB.swift
//  swap
//
//  Created by Мария on 23/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class ServiceDB {
    static let shared = ServiceDB()
    
    private var serviceList: [Service] = []
    private var tagList: [Tag] = TagsDB.shared.getTagList()
    
    private let cityDB = CityDB.shared
    private let tagDB = TagsDB.shared
    
    private init() {
        let cityList = cityDB.getCityList()
        guard cityList.count > 1 else { return }
        let firstCity = cityList[0]
        let secondCity = cityList[1]
        
        let tag = tagList[0]
        
        let service1 = Service(name: "Научу создавать украшения", description: "Брошки для свадеб и для повседневной носки. В обмен ищу фотографа, который сможет отснять коллекцию. Еще хотелось бы сотрудничать с модельерами и интересно получить консультацию по раскрутке своего бренда."
            , image: UIImage(named: "jewerly-1"), author: "Маша", city: firstCity, tag: tag)
        let service2 = Service(name: "Набью тату", description: "В обмен хочу научиться чему-то новому. Мечтаю уметь жонглировать и готовить выпечку.", image: UIImage(named: "tatoo"), author: "Tёма", city: secondCity, tag: tag)
        
        let service3 = Service(name: "Гравирую украшения и технику", description: "Могу написать имя твоей любимой на колечке или любовное послание на ее новом айфоне, взамен поболтал бы на английском"
, image: UIImage(named: "jewelry"), author: "Петя", city: secondCity, tag: tag)
        let service4 = Service(name: "Бабушка шьет игрушки" , description: "Милые игрушки для детей и как подарок-сувенир для взрослых. Вы можете с ней договориться о выборе любого цвета.Взамен было бы неплохо, если бы ей помогли по дому и настроили компьютер. Также, вы можете помочь ей посадить что-то на даче или подарить интересные семена цветов.", image: UIImage(named: "toy"), author: "Катя", city: firstCity, tag: tag)
        let service5 = Service(name: "Ушью одежду", description: "Занимаюсь шитьем одежды на заказ, могу выполнить для вашей одежды небольшую работу взамен, если кто-то присмотрит за моей собачкой", image: UIImage(named: "suits"), author: "Нина", city: firstCity, tag: tag)
        
        
        serviceList = [service1, service2, service3, service4, service5]
        
    }
    
    func getAllServices() -> [Service] {
        return serviceList
    }
    
}
