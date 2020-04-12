//
//  UIViewController+showAlert.swift
//  swap
//
//  Created by Мария on 09/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func show(error: Error) {
        let alertVc = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        let actionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertVc.addAction(actionOk)
        present(alertVc, animated: true, completion: nil)
    }
}
