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

 //1) Logout обычно находится в профиле
 //2) Профиль имеет Имя? Фамилию и прочие параметры

enum ModuleType {
    case main
    case auth

    var storyboardName: String {
        switch self {
        case .auth:
            return "Auth"
        case .main:
            return "Main"
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
            open(module: .main, options: [])
        } else {
            open(module: .auth, options: [])
        }
    }

    func open(module type: ModuleType, options: UIView.AnimationOptions = [.transitionFlipFromRight]) {
        let storyboard = UIStoryboard(name: type.storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()

        guard let window = window else { return }
        UIView.transition(with: window, duration: 0.3, options: options, animations: {
            window.rootViewController = vc
        }, completion: nil)

    }

}
