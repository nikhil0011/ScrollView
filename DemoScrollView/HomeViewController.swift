//
//  HomeViewController.swift
//  DemoScrollView
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

fileprivate let itemsPerRow: CGFloat = 2
fileprivate var sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)

class HomeViewController: UIViewController {
    @IBOutlet var postCollectionView: UICollectionView!
    @IBOutlet var storyCollectionView: UICollectionView!

    let cellID = "postCell"
    let storyCellId = "storyCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        createStoryCollectionView()
        createpostCollectionView()
    }

    
    func createpostCollectionView(){
       
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 500)
        let frame = CGRect(x: 0, y: 130, width: self.view.frame.width, height: self.view.frame.height - self.storyCollectionView.frame.height)
        //        self.navigationController?.navigationBar.barTintColor = .white
        
        postCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
         postCollectionView.tag  = 1
        postCollectionView.dataSource = self
        //        postCollectionView.delegate = self
        
        postCollectionView.bounces = true
        //        postCollectionView.alwaysBounceVertical = true
        postCollectionView.alwaysBounceHorizontal = true
        //        layout.scrollDirection = .horizontal
        postCollectionView.showsVerticalScrollIndicator = false
        postCollectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        postCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(postCollectionView)
    }
    
    func createStoryCollectionView(){
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let parent = self.parent as? DashboardTabBarController
        let navbarheight = parent?.navigationController?.navigationBar.frame.height
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 80, height: 110)
        let frame = CGRect(x: 0, y: barHeight + 8.0, width: self.view.frame.width, height: 120)
        //        self.navigationController?.navigationBar.barTintColor = .white
        
        storyCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        storyCollectionView.tag  = 0
        storyCollectionView.dataSource = self
        storyCollectionView.delegate = self
        
        storyCollectionView.bounces = true
        //        postCollectionView.alwaysBounceVertical = true
        storyCollectionView.alwaysBounceHorizontal = true
                layout.scrollDirection = .horizontal
        storyCollectionView.showsVerticalScrollIndicator = false
        storyCollectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: storyCellId)
        storyCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(storyCollectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellId, for: indexPath) as! StoryCollectionViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PostCollectionViewCell
            return cell

        default:
            break
        }
        return UICollectionViewCell()
    }
    
}
extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Kya kare?",indexPath.row)
        switch collectionView.tag {
        case 0:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "manageViewController")
            self.present(controller, animated: true, completion: nil)
            break
        default:
            break
        }
    }
}
//extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    //1
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 300, height: 300)
//    }
//
//    //3
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: self.postCollectionView.frame.width / (8 + 1) , right: 0.0)
//        return sectionInsets
//    }
//
//    // 4
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
//
//}
//
