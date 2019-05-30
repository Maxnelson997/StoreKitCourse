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
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.goToCart()
        }
    }
    
    @objc func goToCart() {
        self.navigationController?.pushViewController(CartController(), animated: true)
    }
}
