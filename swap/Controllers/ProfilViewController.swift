//
//  ProfilViewController.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class ProfilViewController: UIViewController {
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var AddOfferView: ShadowView!
    @IBOutlet weak var profilImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.layer.cornerRadius = 13
        image1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        fillUser()
    }
    
    func fillUser() {
        nameLabel.text = UserService.shared.getUser()?.name
        nameCityLabel.text = UserService.shared.getUser()?.city?.name
    }

    @IBAction func logout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            MainRouter.shared.open(module: .auth)
        } catch {
            show(error: error)
        }
    }
    
    @IBAction func profileImageDidTaped(_ sender: Any) {
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let actionCamera = UIAlertAction(title: "Открыть камеру", style: .default) { (_) in
            self.openCamera()
        }

        let actionGallery = UIAlertAction(title: "Открыть галерею", style: .default) { (_) in
            self.openGallery()
        }
        
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertVC.addAction(actionCamera)
        alertVC.addAction(actionGallery)
        alertVC.addAction(actionCancel)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    func openGallery() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = false
        vc.sourceType = .photoLibrary
        present(vc, animated: true, completion: nil)
    }
    
    func openCamera() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}

extension ProfilViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            profilImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
