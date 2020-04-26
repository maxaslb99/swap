//
//  ActivityIndicatorView.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class ActivityIndicatorView: UIView {
    
    private var activityIndicatorView: NVActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        isUserInteractionEnabled = false
        backgroundColor = .clear
        let color = UIColor.white
        let frame = self.layer.bounds
        let type = NVActivityIndicatorType.ballBeat
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: type, color: color, padding: nil)
        self.addSubview(activityIndicatorView)
    }
    
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimation() {
        activityIndicatorView.stopAnimating()
    }
    
}
