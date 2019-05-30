//
//  CartController.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class CartController: UIViewController {
    
    fileprivate let totalLabel: UILabel = UILabel()
    fileprivate let balanceLabel: UILabel = UILabel()
    
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
        setupCartLabels()
        setupCartButtons()
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tb)
        tb.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tb.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        tb.dataSource = self
        tb.delegate = self
    }
    
    fileprivate func setupCartLabels() {
        totalLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        totalLabel.text = "Total: 0 credits"
        
        balanceLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        balanceLabel.text = "Balance: 0 credits"
        
        let line = UIView()
        line.backgroundColor = .black
        
        let line1 = UIView()
        line1.backgroundColor = .black
        
        
        let stack = UIStackView(arrangedSubviews: [totalLabel, line, balanceLabel, line1])
        stack.axis = .vertical
        stack.spacing = 30
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.topAnchor.constraint(equalTo: tb.bottomAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line1.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    fileprivate func setupCartButtons() {
        let payButton = MCButton(text: "Pay", width: 108, height: 45)
        let buyAnotherCreditButton = MCButton(text: "Buy Another Credit", width: UIScreen.main.bounds.width - 108 - 20 - 40, height: 45)
        
        let buttonStack = UIStackView(arrangedSubviews: [buyAnotherCreditButton, payButton])
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.spacing = 20
        
        view.addSubview(buttonStack)
        
        buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        payButton.addTarget(self, action: #selector(handlePay), for: .touchUpInside)
        buyAnotherCreditButton.addTarget(self, action: #selector(handleBuy), for: .touchUpInside)
    }
    
    @objc fileprivate func handlePay() {
        print("trying to pay for books")
    }
    
    @objc fileprivate func handleBuy() {
        let popup = MCPopup()
        view.addSubview(popup)
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
