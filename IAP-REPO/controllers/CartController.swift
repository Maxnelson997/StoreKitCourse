//
//  CartController.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class CartController: UIViewController {
    
    fileprivate let tb: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.allowsSelection = false
        tb.register(MCCartViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "cart"
        view.backgroundColor = .white
        
        setupTableView()
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
    
}

extension CartController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension CartController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MCCartViewCell
        cell.book = books[indexPath.row]
        return cell
    }
    

}
