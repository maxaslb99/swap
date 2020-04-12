//
//  TagsViewController.swift
//  swap
//
//  Created by Мария on 22/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
class TagsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let tagsDB = TagsDB.shared
    let tagsService = TagsService.shared
      private var selectedTagIndexPath: IndexPath?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 72
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagsDB.getTagList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TagsTableViewCell
        
        let tagList = tagsDB.getTagList()
        let tag = tagList[indexPath.row]
        cell.nameLabel.text = tag.name
        let isSelected = tag.id == tagsService.selectedTag?.id
        cell.setSelection(isSelected)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tagsList = tagsDB.getTagList()
        
        TagsService.shared.selectedTag = tagsList[indexPath.row]
        
        if let selectedTagIndexPath = selectedTagIndexPath,
            let cell = tableView.cellForRow(at: selectedTagIndexPath) as? TagsTableViewCell {
            cell.setSelection(false)
        }
        if let cell = tableView.cellForRow(at: indexPath) as? TagsTableViewCell {
            cell.setSelection(true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        
        
        
    }
    
}
}
