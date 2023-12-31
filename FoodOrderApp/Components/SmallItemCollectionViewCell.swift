//
//  SmallItemCollectionViewCell.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 17.10.2023.
//

import UIKit

class SmallItemCollectionViewCell: UICollectionViewCell {
    
    private let categoryImage: UIImageView = {
        let categoryImage = UIImageView()
        categoryImage.image = UIImage(named: "smallItem1")
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.contentMode = .scaleAspectFit
        categoryImage.clipsToBounds = true
        return categoryImage
    }()
    
    private lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 14)
        categoryLabel.textColor = UIColor(named: "Header")
        categoryLabel.textAlignment = .center
        categoryLabel.text = "Italian"
        return categoryLabel
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
        self.categoryImage.layer.cornerRadius = 10
    }
    
    private func setupSelf() {
        self.backgroundColor = .clear
        
        self.addSubview(categoryImage)
        self.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryImage.heightAnchor.constraint(equalToConstant: 88),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    func setup(restaurant: Restaurant) {
        categoryImage.image = UIImage(named: restaurant.image)
        categoryLabel.text = restaurant.name
    }
}

extension SmallItemCollectionViewCell {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 1.0
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 0.5
            }, completion: nil)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 1.0
            }, completion: nil)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 1.0
            }, completion: nil)
        }
    }
}
