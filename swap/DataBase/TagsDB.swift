//
//  TagsDB.swift
//  swap
//
//  Created by Мария on 22/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

class TagsDB {
    
    private var tagList: [Tag] = []
    
    static let shared = TagsDB()
    private init() {
        let tag1 = Tag(name: "Красота", id: "1")
        let tag2 = Tag(name: "Животные", id: "2")
        let tag3 = Tag(name: "Мода", id: "3")
        let tag5 = Tag(name: "Кулинария", id:"5")
        let tag6 = Tag(name: "Рукоделие", id:"6")
        let tag7 = Tag(name: "Татуировки", id:"7")
        let tag8 = Tag(name: "Спорт", id:"8")
        let tag9 = Tag(name: "Ремонт", id:"9")
        let tag10 = Tag(name: "Дизайн", id:"10")
        let tag11 = Tag(name: "Уборка", id:"11")
        let tag12 = Tag(name: "Обучение", id:"12")
        
        
        tagList = [ tag1, tag2, tag3, tag5, tag6, tag7, tag8, tag9, tag10, tag11, tag12]
    }
    
    func getTagList() -> [Tag] {
        return tagList
    }
    
}
