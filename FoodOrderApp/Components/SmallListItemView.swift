//
//  SmallListItemView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class SmallListItemView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smallItem1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
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
    
    private let HStackView: UIStackView = {
        let HStackView = UIStackView()
        HStackView.axis = .horizontal
        HStackView.alignment = .leading
        HStackView.distribution = .fillProportionally
        return HStackView
    }()
    
    private let VStackView: UIStackView = {
        let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.distribution = .fillEqually
        return VStackView
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
        
        HStackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(restaurantLabel)
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(placeholderCafeType)
        placeholderCafeType.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(placeholderRating)
        placeholderRating.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        HStackView.isLayoutMarginsRelativeArrangement = true
        
        VStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 16)
        VStackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            HStackView.topAnchor.constraint(equalTo: topAnchor),
            HStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            HStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            HStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            VStackView.heightAnchor.constraint(equalToConstant: 75),
            
            imageView.heightAnchor.constraint(equalToConstant: 75),
            imageView.widthAnchor.constraint(equalToConstant: 75)
        ])
        
    }

}
