//
//  SearchBarView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 17.10.2023.
//

import UIKit

class SearchBarView: UIView {
    
    private let iconLabel: UIImageView = {
        let iconLabel = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.image = UIImage(systemName: "magnifyingglass",withConfiguration: config)
        iconLabel.tintColor = UIColor(red: 0.486, green: 0.49, blue: 0.494, alpha: 1)
        iconLabel.contentMode = .scaleAspectFit
        return iconLabel
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search Food"
        textField.textColor = UIColor(red: 0.486, green: 0.49, blue: 0.494, alpha: 1)
        return textField
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
        self.addSubview(iconLabel)
        self.addSubview(textField)
        
        self.layer.cornerRadius = 26
        self.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        
        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: topAnchor),
            iconLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}
