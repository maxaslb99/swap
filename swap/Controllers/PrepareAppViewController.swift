//
//  PrepareAppViewController.swift
//  swap
//
//  Created by Мария on 23/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth

class PrepareAppViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUser()
    }
    
    func loadUser() {
        guard let user = Auth.auth().currentUser else {
            MainRouter.shared.open(module: .auth)
            return
        }
        
        let db = Firestore.firestore()
        
        let uid = user.uid
        
        db.collection(FirebaseDBKeys.users).document(uid).getDocument { [weak self] (doc, error) in
            if let error = error {
                self?.show(error: error)
            } else if let doc = doc, doc.exists, let dict = doc.data() {
                
                do {
                    let user = try User(dictionary: dict)
                    UserService.shared.save(user: user)
                    if user.city == nil {
                        MainRouter.shared.open(module: .citySelection, options: [.transitionCrossDissolve])
                    } else {
                        MainRouter.shared.open(module: .main, options: [.transitionCrossDissolve])
                    }
                } catch {
                    self?.show(error: error)
                }
                
            }
        }
    }
}
