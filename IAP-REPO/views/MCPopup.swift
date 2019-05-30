//
//  MCPopup.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class MCPopup: UIView {
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "buy another credit"
        label.textAlignment = .center
        return label
    }()
    
    let oneImage:UIImageView = {
        let one = UIImageView(image: UIImage(named: "creditsymbol"))
        one.contentMode = .scaleAspectFit
        return one
    }()
    
    let oneCreditLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "one credit"
        label.textAlignment = .center
        return label
    }()
    
    let priceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "$4.99"
        label.textAlignment = .center
        return label
    }()
    
    let buyButton: MCButton = MCButton(text: "Buy")
    
    fileprivate lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [oneImage, oneCreditLabel, priceLabel, buyButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.setCustomSpacing(35, after: priceLabel)
        return stack
    }()
    
    fileprivate let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 24
        return v
    }()
    
    fileprivate var effect:UIVisualEffect = UIBlurEffect(style: .prominent)
    fileprivate lazy var blurView:UIVisualEffectView = UIVisualEffectView(effect: effect)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animateOut)))
        setupViews()
        animateIn()
    }
    
    fileprivate func setupViews() {
        let screenFrame = UIScreen.main.bounds
        self.frame = screenFrame
        blurView.frame = screenFrame
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        self.addSubview(blurView)
        
        blurView.contentView.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(stack)
        
        container.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.45).isActive = true
        container.widthAnchor.constraint(equalTo: blurView.widthAnchor, multiplier: 0.7).isActive = true
        container.centerYAnchor.constraint(equalTo: blurView.centerYAnchor, constant: -50).isActive = true
        container.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        oneImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        stack.widthAnchor.constraint(equalToConstant: 108).isActive = true
        stack.centerYAnchor.constraint(equalTo: blurView.centerYAnchor, constant: -50).isActive = true
        stack.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true
        
        buyButton.addTarget(self, action: #selector(buyCredit), for: .touchUpInside)
        buyButton.widthAnchor.constraint(equalToConstant: 108).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc fileprivate func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
            self.blurView.effect = nil
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.alpha = 1
            self.container.transform = .identity
            self.blurView.effect = self.effect
        })
    }
    
    @objc fileprivate func buyCredit() {
        print("trying to buy another credit for $4.99 with StoreKit IAP")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

