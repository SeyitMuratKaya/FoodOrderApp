//
//  ListHeaderView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class ListHeaderView: UIView {
    
    public var text: String? {
        didSet {
            if let text {
                headerText.text = text
            }
        }
    }
    
    private let headerText: UILabel = {
        let headerText = UILabel()
        headerText.text = "Popular Restaurants"
        headerText.font = UIFont.boldSystemFont(ofSize: 20)
        headerText.textColor = UIColor(named: "Header")
        return headerText
    }()
    
    private let navigationText: UILabel = {
        let navigationText = UILabel()
        navigationText.text = "View All"
        navigationText.font = UIFont.systemFont(ofSize: 13)
        navigationText.textColor = UIColor(named: "ButtonColor")
        return navigationText
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
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
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.addArrangedSubview(headerText)
        headerText.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.addArrangedSubview(navigationText)
        navigationText.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
}
