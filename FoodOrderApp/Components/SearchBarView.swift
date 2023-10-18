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
        iconLabel.tintColor = UIColor(named: "SearchPlaceholder")
        iconLabel.contentMode = .scaleAspectFit
        return iconLabel
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search Food"
        textField.textColor = UIColor(named: "SearchPlaceholder")
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
        self.backgroundColor = UIColor(named: "SearchBackground")
        
        iconLabel.setContentHuggingPriority(.defaultHigh + 1, for: .horizontal)
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
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
