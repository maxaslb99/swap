//
//  TagsService.swift
//  swap
//
//  Created by Мария on 22/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation

class TagsService {
    
    static var shared = TagsService()
    private init() {}
    
    var selectedTag: Tag?
    
}
