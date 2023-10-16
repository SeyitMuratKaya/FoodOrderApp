//
//  LargeListItemView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class LargeListItemView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "largeItem2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let HStackView: UIStackView = {
        let HStackView = UIStackView()
        HStackView.axis = .horizontal
        HStackView.alignment = .leading
        return HStackView
    }()
    
    private let VStackView: UIStackView = {
        let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.distribution = .fillProportionally
        return VStackView
    }()
    
    private let innerVStackView: UIStackView = {
        let innerVStackView = UIStackView()
        innerVStackView.axis = .vertical
        innerVStackView.distribution = .fillProportionally
        return innerVStackView
    }()
    
    private let restaurantLabel: UILabel = {
        let restaurantLabel = UILabel()
        restaurantLabel.text = "Cafe de Noir"
        restaurantLabel.font = UIFont.systemFont(ofSize: 16)
        restaurantLabel.textColor = UIColor(red: 0.29, green: 0.294, blue: 0.302, alpha: 1)
        return restaurantLabel
    }()
    
    private let placeholderRating: UILabel = {
        let placeholderRating = UILabel()
        placeholderRating.text = "4.9 (124) ratings"
        placeholderRating.font = UIFont.systemFont(ofSize: 12)
        placeholderRating.textColor = UIColor(red: 0.714, green: 0.718, blue: 0.718, alpha: 1)
        return placeholderRating
    }()
    
    private let placeholderCafeType: UILabel = {
        let placeholderCafeType = UILabel()
        placeholderCafeType.text = "Cafe - Western Food"
        placeholderCafeType.font = UIFont.systemFont(ofSize: 12)
        placeholderCafeType.textColor = UIColor(red: 0.714, green: 0.718, blue: 0.718, alpha: 1)
        return placeholderCafeType
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
        self.addSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false

        self.VStackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.VStackView.addArrangedSubview(innerVStackView)
        innerVStackView.translatesAutoresizingMaskIntoConstraints = false

        self.innerVStackView.addArrangedSubview(restaurantLabel)
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.innerVStackView.addArrangedSubview(HStackView)
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.HStackView.addArrangedSubview(placeholderRating)
        placeholderRating.translatesAutoresizingMaskIntoConstraints = false
        
        self.HStackView.addArrangedSubview(placeholderCafeType)
        placeholderCafeType.translatesAutoresizingMaskIntoConstraints = false
        
        innerVStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        innerVStackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            VStackView.topAnchor.constraint(equalTo: topAnchor),
            VStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            VStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            VStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
