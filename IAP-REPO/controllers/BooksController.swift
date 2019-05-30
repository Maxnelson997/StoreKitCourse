//
//  BooksController.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class BooksController: UIViewController {
    
    fileprivate let tb: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.allowsSelection = false
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    override func viewDidLoad() {
        self.navigationItem.title = "maxreads"
        view.backgroundColor = .white
    
        setupAddToCartButton()
        setupTableView()
    }
    
    fileprivate func setupAddToCartButton() {
        let cart = MCButton(text: "Cart", width: 108, height: 45)
        view.addSubview(cart)
        
        cart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        cart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        cart.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tb)
        tb.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tb.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        tb.dataSource = self
        tb.delegate = self
    }
    
    @objc func goToCart() {
        self.navigationController?.pushViewController(CartController(), animated: true)
    }
}

extension BooksController: UITableViewDelegate {
    
}

extension BooksController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "product title and IAP price you will charge the user."
        return cell
    }
    
    
}
