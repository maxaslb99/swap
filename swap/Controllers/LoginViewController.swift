//
//  LoginViewController.swift
//  swap
//
//  Created by Мария on 09/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.show(error: error)
            }
            
            if let result = result {
                MainRouter.shared.open(module: .main)
            }
        }
    }
    
    @IBAction func registration(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
