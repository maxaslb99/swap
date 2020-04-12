//
//  CityViewController.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class FirstChooseOfCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let cityDB: CityDB = CityDB.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 72
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDB.getCityList().count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FirstChooseCityCell
        let index = indexPath.row
        let cityList = cityDB.getCityList()
        cell.nameLabel.text = cityList[index].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityList = cityDB.getCityList()
        CityService.shared.selectedCity = cityList[indexPath.row]
        performSegue(withIdentifier: "didChooseCity", sender: nil)
    }
    
}
