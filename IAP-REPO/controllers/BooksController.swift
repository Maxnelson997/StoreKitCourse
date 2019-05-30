//
//  BooksController.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class BooksController: UIViewController {
    override func viewDidLoad() {
        self.navigationItem.title = "maxreads"
        view.backgroundColor = .white
    
        setupAddToCartButton()
    }
    
    fileprivate func setupAddToCartButton() {
        let cart = MCButton(text: "Cart", width: 108, height: 45)
        view.addSubview(cart)
        
        cart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        cart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        cart.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
    }
    
    @objc func goToCart() {
        self.navigationController?.pushViewController(CartController(), animated: true)
    }
}
