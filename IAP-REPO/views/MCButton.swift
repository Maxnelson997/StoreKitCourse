//
//  MCButton.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class MCButton: UIButton {
    init(text: String, width: CGFloat = 108, height: CGFloat = 45, hasShadow: Bool = true) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        self.layer.cornerRadius = 22.5
        self.backgroundColor = .primaryOne
        self.setTitle(text, for: .normal)
        
        hasShadow ? setupShadow(height, width) : ()
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    fileprivate func setupShadow(_ height: CGFloat, _ width: CGFloat) {
        let shadowSize: CGFloat = 20
        let contactRect = CGRect(x: 0, y: height - (shadowSize * 0.6), width: width, height: shadowSize)
        self.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor = UIColor.primaryOne.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
