//
//  CityViewController.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

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
        let city = cityList[indexPath.row]
        saveInDB(city)
    }
    
    func saveInDB(_ city: City) {
        
        guard let user = Auth.auth().currentUser else {
            MainRouter.shared.open(module: .auth)
            return
        }
        
        
        let db = Firestore.firestore()
        
        do {
            let dict: [String: Any] = try city.toDictionary()
            db.collection(FirebaseDBKeys.users).document(user.uid).updateData(dict) { [weak self] (error) in
                if let error = error {
                    self?.show(error: error)
                } else {
                    self?.updateUser(city: city)
                    CityService.shared.selectedCity = city
                    MainRouter.shared.open(module: .main, options: [.transitionCrossDissolve])
                }
            }
        } catch {
            show(error: error)
        }
    }
    
    func updateUser(city: City) {
        if var user = UserService.shared.getUser() {
            user.city = city
            UserService.shared.save(user: user)
        }
    }
}
