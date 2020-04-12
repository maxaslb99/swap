//
//  NotificnationsViewController.swift
//  swap
//
//  Created by Мария on 22/12/2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import Foundation
import UIKit

class NotificationsViewController: UIViewController  {
    @IBOutlet weak var notificationViev: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        }
}
