//
//  MainRouter.swift
//  swap
//
//  Created by Мария on 09/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

enum ModuleType {
    case main
    case auth
    case prepareApp
    case citySelection
    
    var storyboardName: String {
        switch self {
        case .auth:
            return "Auth"
        case .main:
            return "Main"
        case .prepareApp:
            return "PrepareApp"
        case .citySelection:
            return "FirstChooseOfCity"
        }
    }
}

class MainRouter {

    static let shared = MainRouter()

    var window: UIWindow?

    var isLoggedIn: Bool {
        return Auth.auth().currentUser != nil
    }

    private init() {
        if #available(iOS 13.0, *) {
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            window = sceneDelegate?.window
        } else {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            window = appDelegate?.window
        }
    }

    func openInitialModule() {
        if isLoggedIn {
            open(module: .prepareApp, options: [])
        } else {
            open(module: .auth, options: [])
        }
    }

    func open(module type: ModuleType, options: UIView.AnimationOptions = [.transitionFlipFromRight]) {
        let storyboard = UIStoryboard(name: type.storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()

        guard let window = window else { return }
        
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.3, options: options, animations: {
            
        }, completion: nil)

    }

}
