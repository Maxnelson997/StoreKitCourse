//
//  MCBookViewCell.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class MCBookViewCell: UITableViewCell {
    
    let coverImage:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "book title"
        return label
    }()
    
    let authorLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = UIColor.gray
        label.text = "author name"
        return label
    }()
    
    let creditLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.text = "1 credit"
        return label
    }()
    
    let ratingLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.text = "5/5"
        label.textColor = .primaryOne
        return label
    }()
    
    let addToCartButton:UIButton = {
        let button = MCButton(text: "+", width: 25, height: 25, hasShadow: false)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12.5
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(coverImage)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(addToCartButton)
        
        coverImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        coverImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        coverImage.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        
        let ratingButtonStack = UIStackView(arrangedSubviews: [ratingLabel, addToCartButton])
        ratingButtonStack.axis = .vertical
        ratingButtonStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingButtonStack)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel, creditLabel])
        stackView.setCustomSpacing(20, after: authorLabel)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 10).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: ratingButtonStack.leadingAnchor).isActive = true
        
        
        ratingButtonStack.widthAnchor.constraint(equalToConstant: 25).isActive = true
        ratingButtonStack.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        ratingButtonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        ratingButtonStack.distribution = .equalSpacing
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
