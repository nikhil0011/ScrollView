//
//  MarketPlaceTableViewCell.swift
//  DemoScrollView
//
//  Created by Admin on 8/4/18.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class MarketPlaceTableViewCell: UITableViewCell {

    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 80, height: 110)
        layout.scrollDirection = .horizontal
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        var collection  = UICollectionView(frame: rect, collectionViewLayout: layout)
        collection.bounces = true
        collection.alwaysBounceHorizontal = true
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = UIColor.white
        collection.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "storyCellId")
        return collection
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 8.0).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8.0).isActive = true
    }
}

extension MarketPlaceTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
