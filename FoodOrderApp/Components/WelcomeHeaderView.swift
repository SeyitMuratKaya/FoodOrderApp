//
//  WelcomeHeaderView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 17.10.2023.
//

import UIKit

class WelcomeHeaderView: UIView {
    
    private let HStackView: UIStackView = {
        let HStackView = UIStackView()
        HStackView.axis = .horizontal
        HStackView.alignment = .center
        HStackView.distribution = .fill
        return HStackView
    }()
    
    private let welcomeText: UILabel = {
        let welcomeText = UILabel()
        welcomeText.text = "\(Date().timeOfDayGreeting()), Murat"
        welcomeText.font = UIFont.boldSystemFont(ofSize: 20)
        welcomeText.textColor = UIColor(named: "Header")
        return welcomeText
    }()
    
    private let cartImage: UIImageView = {
        let cartImage = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        cartImage.image = UIImage(systemName: "cart.fill", withConfiguration: config)
        cartImage.tintColor = UIColor(named: "Header")
        return cartImage
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(welcomeText)
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cartImage)
        cartImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeText.topAnchor.constraint(equalTo: topAnchor),
            welcomeText.leadingAnchor.constraint(equalTo: leadingAnchor),
            welcomeText.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            cartImage.topAnchor.constraint(equalTo: topAnchor),
            cartImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cartImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}
