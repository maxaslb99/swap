//
//  LoginViewController.swift
//  swap
//
//  Created by Мария on 09/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                self?.show(error: error)
            }
            
            if let result = result {
//                MainRouter.shared.open(module: .prepareApp)
                self?.loadUser(byUid: result.user.uid)
            }
        }
    }
    
    func loadUser(byUid uid: String) {
        let db = Firestore.firestore()

        db.collection(FirebaseDBKeys.users).document(uid).getDocument { [weak self] (doc, error) in
            if let error = error {
                self?.show(error: error)
            } else if let doc = doc, doc.exists, let dict = doc.data() {

                do {
                    let user = try User(dictionary: dict)
                    UserService.shared.save(user: user)
                    if user.city == nil {
                        MainRouter.shared.open(module: .citySelection)
                    } else {
                        MainRouter.shared.open(module: .main)
                    }
                } catch {
                    self?.show(error: error)
                }

            }
        }
    }
    
    @IBAction func registration(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
