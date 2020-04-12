//
//  NoteButton.swift
//  swap
//
//  Created by Мария on 22/12/2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import Foundation
import UIKit

class NoteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .clear
        tintColor = .clear
        let note = UIImage(named: "heart")
        let noteChecked = UIImage(named: "heart")
        setImage(note, for: .normal)
        setImage(noteChecked, for: .selected)
        imageView?.contentMode = .scaleAspectFit
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isSelected = !isSelected
    }
    
}
