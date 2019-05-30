//
//  MCButton.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class MCButton: UIButton {
    init(text: String, width: CGFloat = 108, height: CGFloat = 45) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        self.layer.cornerRadius = 22.5
        self.backgroundColor = .primaryOne
        self.setTitle(text, for: .normal)
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
