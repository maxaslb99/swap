//
//  ProfilViewController.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class ProfilViewController: UIViewController {
    @IBOutlet weak var image1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.layer.cornerRadius = 13
        image1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//        navigationItem.hidesBackButton = true
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    
        }
    }

