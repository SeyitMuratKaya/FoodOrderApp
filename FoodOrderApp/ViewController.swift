//
//  ViewController.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var foodCategoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .systemBlue
        return collectionView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemRed
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let welcomeHeader: WelcomeHeaderView = {
        let welcomeHeader = WelcomeHeaderView()
        return welcomeHeader
    }()
    
    private let sampleLargeItems: [LargeListItemView] = {
        var items: [LargeListItemView] = []
        for x in 0..<3 {
            let iv = LargeListItemView()
            items.append(iv)
        }
        return items
    }()
    
    private let sampleSmallItems: [SmallListItemView] = {
        var items: [SmallListItemView] = []
        for x in 0..<3 {
            let iv = SmallListItemView()
            items.append(iv)
        }
        return items
    }()
    
    private let sampleHeader1: ListHeaderView = {
        let sampleHeader = ListHeaderView()
        return sampleHeader
    }()
    
    private let sampleHeader2: ListHeaderView = {
        let sampleHeader = ListHeaderView()
        return sampleHeader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
        foodCategoryCollectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
        ])
        
        self.contentView.addSubview(welcomeHeader)
        self.contentView.addSubview(foodCategoryCollectionView)
        self.contentView.addSubview(sampleHeader1)
        self.contentView.addSubview(sampleLargeItems[0])
        self.contentView.addSubview(sampleLargeItems[1])
        self.contentView.addSubview(sampleLargeItems[2])
        self.contentView.addSubview(sampleHeader2)
        self.contentView.addSubview(sampleSmallItems[0])
        self.contentView.addSubview(sampleSmallItems[1])
        self.contentView.addSubview(sampleSmallItems[2])
        
        welcomeHeader.translatesAutoresizingMaskIntoConstraints = false
        sampleHeader1.translatesAutoresizingMaskIntoConstraints = false
        sampleLargeItems[0].translatesAutoresizingMaskIntoConstraints = false
        sampleLargeItems[1].translatesAutoresizingMaskIntoConstraints = false
        sampleLargeItems[2].translatesAutoresizingMaskIntoConstraints = false
        
        sampleHeader2.translatesAutoresizingMaskIntoConstraints = false
        sampleSmallItems[0].translatesAutoresizingMaskIntoConstraints = false
        sampleSmallItems[1].translatesAutoresizingMaskIntoConstraints = false
        sampleSmallItems[2].translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            
            welcomeHeader.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            welcomeHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            welcomeHeader.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            welcomeHeader.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            foodCategoryCollectionView.topAnchor.constraint(equalTo: self.welcomeHeader.bottomAnchor),
            foodCategoryCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            foodCategoryCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            foodCategoryCollectionView.heightAnchor.constraint(equalToConstant: 90),
//            foodCategoryCollectionView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleHeader1.topAnchor.constraint(equalTo: self.foodCategoryCollectionView.bottomAnchor),
            sampleHeader1.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleHeader1.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleHeader1.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleLargeItems[0].topAnchor.constraint(equalTo: self.sampleHeader1.bottomAnchor),
            sampleLargeItems[0].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleLargeItems[0].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleLargeItems[0].heightAnchor.constraint(equalToConstant: 300),
            sampleLargeItems[0].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleLargeItems[1].topAnchor.constraint(equalTo: self.sampleLargeItems[0].bottomAnchor),
            sampleLargeItems[1].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleLargeItems[1].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleLargeItems[1].heightAnchor.constraint(equalToConstant: 300),
            sampleLargeItems[1].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleLargeItems[2].topAnchor.constraint(equalTo: self.sampleLargeItems[1].bottomAnchor),
            sampleLargeItems[2].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleLargeItems[2].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleLargeItems[2].heightAnchor.constraint(equalToConstant: 300),
            sampleLargeItems[2].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleHeader2.topAnchor.constraint(equalTo: self.sampleLargeItems[2].bottomAnchor),
            sampleHeader2.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleHeader2.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleHeader2.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[0].topAnchor.constraint(equalTo: self.sampleHeader2.bottomAnchor),
            sampleSmallItems[0].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[0].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleSmallItems[0].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[1].topAnchor.constraint(equalTo: self.sampleSmallItems[0].bottomAnchor),
            sampleSmallItems[1].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[1].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleSmallItems[1].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[2].topAnchor.constraint(equalTo: self.sampleSmallItems[1].bottomAnchor),
            sampleSmallItems[2].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[2].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleSmallItems[2].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),

            sampleSmallItems[2].bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell()}
        cell.setup()
        return cell    }
}
