//
//  RegistrationViewController.swift
//  swap
//
//  Created by Мария on 09/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class RegistrationViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: TextFieldWithImage!
    @IBOutlet weak var registrationButton: DefaultButton!
    
    @IBAction func registration(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let name = nameTextField.text ?? ""
        
        guard !name.isEmpty && !email.isEmpty && !password.isEmpty else {
            show(error: ValidationError.fillAllFields)
            return
        }
        
        registrationButton.startLoading()
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                self?.registrationButton.stopLoading()
                self?.show(error: error)
            }
            
            if let result = result {
                let uid = result.user.uid
                let user = User(email: email, uid: uid, name: name)
                self?.initUserInDB(user: user)
            }
        }

    }
    
    func initUserInDB(user: User) {
        let db = Firestore.firestore()
        
        do {
            let dict: [String: Any] = try user.toDictionary()
            db.collection(FirebaseDBKeys.users).document(user.uid).setData(dict) { [weak self] (error) in
                if let error = error {
                    self?.show(error: error)
                } else {
                    UserService.shared.save(user: user)
                    MainRouter.shared.open(module: .citySelection)
                }
                self?.registrationButton.stopLoading()
            }
        } catch {
            self.registrationButton.stopLoading()
            show(error: error)
        }
        
    }
    
    @IBAction func login(_ sender: Any) {
    }
    
}
