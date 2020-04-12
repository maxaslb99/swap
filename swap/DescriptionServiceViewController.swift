//
//  DescriptionServiseViewController.swift
//  swap
//
//  Created by Мария on 23/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
class DescriptionServiceViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!
    
    var service: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = service?.name
        descriptionLabel.text = service?.description
        serviceImageView.image = service?.image
        navigationItem.title = service?.author
    }
}
