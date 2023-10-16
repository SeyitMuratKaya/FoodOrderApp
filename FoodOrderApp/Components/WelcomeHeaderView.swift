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
        welcomeText.text = "Good Morning, Murat"
        welcomeText.font = UIFont.boldSystemFont(ofSize: 20)
        welcomeText.textColor = UIColor(red: 0.29, green: 0.294, blue: 0.302, alpha: 1)
        return welcomeText
    }()
    
    private let cartImage: UIImageView = {
        let cartImage = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        cartImage.image = UIImage(systemName: "cart.fill", withConfiguration: config)
        cartImage.tintColor = UIColor(red: 0.29, green: 0.294, blue: 0.302, alpha: 1)
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
        self.addSubview(HStackView)
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(welcomeText)
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(cartImage)
        cartImage.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        HStackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            HStackView.topAnchor.constraint(equalTo: topAnchor),
            HStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            HStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            HStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
