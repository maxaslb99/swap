//
//  SecondCitySelectionViewController.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class SecondCitySelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cityDB = CityDB.shared
    let cityService = CityService.shared
    
    private var selectedCityIndexPath: IndexPath?
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 72
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDB.getCityList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SecondSelectionCityCell
        let cityList = cityDB.getCityList()
        let city = cityList[indexPath.row]
        cell.nameLabel.text = city.name
        let isSelected = city.id == cityService.selectedCity?.id
        cell.setSelected(isSelected)
        if isSelected {
            selectedCityIndexPath = indexPath
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityList = cityDB.getCityList()
        CityService.shared.selectedCity = cityList[indexPath.row]
        if let selectedCityIndexPath = selectedCityIndexPath,
            let cell = tableView.cellForRow(at: selectedCityIndexPath) as? SecondSelectionCityCell {
            cell.setSelected(false)
        }
        if let cell = tableView.cellForRow(at: indexPath) as? SecondSelectionCityCell {
            cell.setSelected(true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
