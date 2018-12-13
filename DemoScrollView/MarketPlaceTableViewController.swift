//
//  MarketPlaceTableViewController.swift
//  DemoScrollView
//
//  Created by Admin on 8/4/18.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit
fileprivate var sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)

class MarketPlaceTableViewController: UITableViewController {
    var headerView: UIView!
    var titleLabel: UILabel!
//    var marketplaceTableView: UITableView!
    
    let cellIdentifier = "notifCell"
    let storyCellId = "storyCellId"

    let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Buy Online"
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.tableView.register(MarketPlaceTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.dataSource = self
        self.tableView.reloadData()
//        setupVcUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    fileprivate func setupVcUI(){
//        self.navigationController?.navigationItem.title = "Buy Online"
//        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
//        let displayWidth: CGFloat = (self.navigationController?.navigationBar.frame.width)!
//        let navheight: CGFloat = (self.navigationController?.navigationBar.frame.height)!
//        marketplaceTableView = UITableView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: displayWidth, height: self.view.frame.height - navheight))
//        marketplaceTableView.backgroundColor = .white
//        self.view.addSubview(marketplaceTableView)
//        //        marketplaceTableView.delegate = self
//        marketplaceTableView.dataSource = self
//        marketplaceTableView.reloadData()
//    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 400
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MarketPlaceTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MarketPlaceTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

   override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? MarketPlaceTableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? MarketPlaceTableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset

    }
    
}

extension MarketPlaceTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count * 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellId, for: indexPath) as! StoryCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

extension MarketPlaceTableViewController: UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: 80, height: 110)
        return itemSize
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

