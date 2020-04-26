//
//  MainViewController.swift
//  swap
//
//  Created by Мария on 15/12/2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

   
    let serviceDB = ServiceDB.shared
    let tagDB = TagsDB.shared
    
    private let tagService = TagsService.shared
    private var selectedService: Service?
    private let cityService = CityService.shared
    
    var filteredServices: [Service] = []
    
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var handImageView: UIImageView!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterServices()
        collectionView.delegate = self
        collectionView.dataSource = self
        tagCollectionView.dataSource = self
        tagCollectionView.delegate = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filterServices()
        collectionView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func filterServices() {
        let allServices = serviceDB.getAllServices()
        if let city = cityService.selectedCity {
            filteredServices = allServices.filter({ (service) -> Bool in
                return service.city.id == city.id
            })
        } else {
            filteredServices = allServices
        }
        
        emptyLabel.isHidden = !filteredServices.isEmpty
        collectionView.isHidden = filteredServices.isEmpty
        handImageView.isHidden = !filteredServices.isEmpty
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return filteredServices.count
        } else {
            return tagDB.getTagList().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            return initServiceCell(indexPath)
        } else {
            return initTagCell(indexPath)
        }
        
    }
    
    func initTagCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tagCollectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        
        let tag = tagDB.getTagList()[indexPath.row]
        cell.set(isSelected: tagService.selectedTag?.id == tag.id)
        cell.fill(with: tag)
        
        return cell
    }
    
    func initServiceCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        let service = filteredServices[indexPath.row]
        cell.fill(with: service)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            didSelectService(indexPath)
        } else {
            didSelectTag(collectionView, indexPath)
        }
    }
    
    func didSelectTag(_ collectionView: UICollectionView, _ indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TagCell {
            cell.set(isSelected: true)
            deselectOldTag(collectionView)
            tagService.selectedTag = tagDB.getTagList()[indexPath.row]
        }
    }
    
    func deselectOldTag(_ collectionView: UICollectionView) {
        guard let oldSelectedTag = tagService.selectedTag else { return }
        
        let tagList = TagsDB.shared.getTagList()
        
        var index = 0
        while index < tagList.count && tagList[index].id != oldSelectedTag.id {
            index += 1
        }
        
        // до этого момента ни один тэг не был выбран
        guard index < tagList.count else { return }
        
        if let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? TagCell {
            cell.set(isSelected: false)
        }
    }
    
    func didSelectService(_ indexPath: IndexPath) {
        selectedService = filteredServices[indexPath.row]
        performSegue(withIdentifier: "openDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DescriptionServiceViewController, let service = selectedService {
            vc.service = service
        }
    }
  
    
}
