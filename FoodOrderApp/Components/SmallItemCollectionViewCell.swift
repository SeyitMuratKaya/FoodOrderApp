//
//  SmallItemCollectionViewCell.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 17.10.2023.
//

import UIKit

class SmallItemCollectionViewCell: UICollectionViewCell {
    
    public var image: UIImage? {
        didSet {
            if let image {
                categoryImage.image = image
            }
        }
    }
    
    public var name: String? {
        didSet {
            if let name {
                categoryLabel.text = name
            }
        }
    }
    
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
}
