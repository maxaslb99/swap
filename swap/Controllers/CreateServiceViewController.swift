//
//  createServiseViewController.swift
//  swap
//
//  Created by Мария on 22/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class CreateServiceViewController: UIViewController {
    @IBAction func firstTextFielf(_ sender: Any) {
    }
    @IBAction func secondTextField(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    
        }
}

