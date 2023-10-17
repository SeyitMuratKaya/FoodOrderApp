//
//  LargeItemCollectionViewCell.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 17.10.2023.
//

import UIKit

class LargeItemCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "largeItem3")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let HStackView: UIStackView = {
        let HStackView = UIStackView()
        HStackView.axis = .horizontal
        HStackView.alignment = .center
        HStackView.distribution = .fillProportionally
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
        restaurantLabel.font = UIFont.boldSystemFont(ofSize: 16)
        restaurantLabel.textColor = UIColor(red: 0.29, green: 0.294, blue: 0.302, alpha: 1)
        return restaurantLabel
    }()
    
    private let cafeRating: CafeRatingView = {
        let cafeRating = CafeRatingView()
        cafeRating.rating = 4.9
        cafeRating.totalRating = 124
        return cafeRating
    }()
    
    private let cafeType: CafeTypeView = {
        let cafeType = CafeTypeView()
        cafeType.restaurantType = "Cafe"
        cafeType.foodType = "Western Food"
        return cafeType
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.layer.cornerRadius = 10
    }
    
    func setup() {
        //self.layer.borderColor = UIColor.systemYellow.cgColor
        //self.layer.borderWidth = 2.0
    }
    
    private func setupSelf() {
        self.backgroundColor = .clear
        
        self.addSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(restaurantLabel)
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(HStackView)
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(cafeType)
        cafeType.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(cafeRating)
        cafeRating.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            VStackView.topAnchor.constraint(equalTo: topAnchor),
            VStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            VStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            VStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}
