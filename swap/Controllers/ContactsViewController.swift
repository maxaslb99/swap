//
//  ContactsViewController.swift
//  swap
//
//  Created by Мария on 24/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
class ContactsViewController: UIViewController {
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
}
}
