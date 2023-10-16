//
//  ViewController.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    //TODO: (fix) isUserInteractionEnabled is not a best practice 
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
    
    private let sampleLargeItems: [LargeListItemView] = {
        var items: [LargeListItemView] = []
        for x in 0..<3 {
            let iv = LargeListItemView()
            iv.isUserInteractionEnabled = false
            items.append(iv)
        }
        return items
    }()
    
    private let sampleSmallItems: [SmallListItemView] = {
        var items: [SmallListItemView] = []
        for x in 0..<3 {
            let iv = SmallListItemView()
            iv.isUserInteractionEnabled = false
            items.append(iv)
        }
        return items
    }()
    
    private let sampleHeader1: ListHeaderView = {
        let sampleHeader = ListHeaderView()
        sampleHeader.isUserInteractionEnabled = false
        return sampleHeader
    }()
    
    private let sampleHeader2: ListHeaderView = {
        let sampleHeader = ListHeaderView()
        sampleHeader.isUserInteractionEnabled = false
        return sampleHeader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        self.view.addSubview(sampleHeader1)
        self.view.addSubview(sampleLargeItems[0])
        self.view.addSubview(sampleLargeItems[1])
        self.view.addSubview(sampleLargeItems[2])
        self.view.addSubview(sampleHeader2)
        self.view.addSubview(sampleSmallItems[0])
        self.view.addSubview(sampleSmallItems[1])
        self.view.addSubview(sampleSmallItems[2])
        
        sampleHeader1.translatesAutoresizingMaskIntoConstraints = false
        sampleLargeItems[0].translatesAutoresizingMaskIntoConstraints = false
        sampleLargeItems[1].translatesAutoresizingMaskIntoConstraints = false
        sampleLargeItems[2].translatesAutoresizingMaskIntoConstraints = false
        
        sampleHeader2.translatesAutoresizingMaskIntoConstraints = false
        sampleSmallItems[0].translatesAutoresizingMaskIntoConstraints = false
        sampleSmallItems[1].translatesAutoresizingMaskIntoConstraints = false
        sampleSmallItems[2].translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            
            sampleHeader1.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            sampleHeader1.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleHeader1.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            //sampleHeader1.heightAnchor.constraint(equalToConstant: 300),
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
//            sampleHeader2.heightAnchor.constraint(equalToConstant: 300),
            sampleHeader2.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[0].topAnchor.constraint(equalTo: self.sampleHeader2.bottomAnchor),
            sampleSmallItems[0].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[0].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            sampleSmallItems[0].heightAnchor.constraint(equalToConstant: 300),
            sampleSmallItems[0].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[1].topAnchor.constraint(equalTo: self.sampleSmallItems[0].bottomAnchor),
            sampleSmallItems[1].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[1].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            sampleSmallItems[1].heightAnchor.constraint(equalToConstant: 300),
            sampleSmallItems[1].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[2].topAnchor.constraint(equalTo: self.sampleSmallItems[1].bottomAnchor),
            sampleSmallItems[2].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[2].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            sampleSmallItems[2].heightAnchor.constraint(equalToConstant: 300),
            sampleSmallItems[2].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),

            sampleSmallItems[2].bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            sampleHeader2.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
}

